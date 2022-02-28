import 'package:flutter/material.dart';
import 'package:flutter_app_trip/dao/travel_dao.dart';
import 'package:flutter_app_trip/model/travel_model.dart';
import 'package:flutter_app_trip/widgets/cached_image.dart';
import 'package:flutter_app_trip/widgets/loading_container.dart';

const PAGE_SIZE = 10;

class TravelTabPage extends StatefulWidget {
  ///从上个页面过来的公共参数
  final String travelUrl;
  final Map params;

  //独立tab 参数
  final String groupChannelCode;
  final int type;

  const TravelTabPage({
    Key? key,
    required this.travelUrl,
    required this.params,
    required this.groupChannelCode,
    required this.type,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelTabPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  bool isLoading = true;
  int page = 1;
  List<TravelItem>? list;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _loadData();

    ///上拉加载更多监听
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData(isLoadMore: true);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoadingContainer(
        isLoading: isLoading,
        child: RefreshIndicator(
            onRefresh: _loadData,
            child: MediaQuery.removePadding(
              removeTop: true,
              context: context,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.all(8.0),
                    sliver: SliverGrid(
                      //Grid
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, //Grid按两列显示
                        mainAxisSpacing: 7.0, //主轴item之间的距离
                        crossAxisSpacing: 8.0, //横轴item之间的距离
                        childAspectRatio: 0.8, //item长宽比
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          //创建子Item widget
                          return _TravelItem(index: index, item: list![index]);
                        },
                        childCount: list?.length ?? 0,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }

  Future _loadData({isLoadMore = false}) async {
    if (isLoadMore) {
      page++;
    } else {
      page = 1;
    }

    TravelModel model = await TravelDao.fetch(widget.travelUrl, widget.params,
        widget.groupChannelCode, widget.type, page, PAGE_SIZE);
    setState(() {
      List<TravelItem> items = _filterItems(model.resultList);
      if (list != null) {
        list!.addAll(items);
      } else {
        list = items;
      }

      isLoading = false;
    });
  }

  //数据过滤
  List<TravelItem> _filterItems(List<TravelItem>? resultList) {
    if (resultList == null) return [];
    List<TravelItem> filterItems = [];
    resultList.forEach((item) {
      filterItems.add(item);
    });
    return filterItems;
  }
}

class _TravelItem extends StatelessWidget {
  final TravelItem item;
  final int index;

  const _TravelItem({
    Key? key,
    required this.item,
    required this.index,
  }) : super(key: key);

  String _poiName() {
    return item.article.pois.length == 0 ? '未知' : item.article.pois[0].poiName;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      clipBehavior: Clip.antiAlias, //抗锯齿
      borderRadius: BorderRadius.circular(6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //默认是剧中
        children: [
          ///Column下使用Expanded撑满高度
          itemImage,
          Container(
              padding: EdgeInsets.only(left: 4, top: 4),
              child: Text(
                item.article.articleTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, color: Colors.black),
              )),
          itemInfo
        ],
      ),
    );
  }

  Widget get itemInfo {
    return Container(
        padding: EdgeInsets.all(4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                PhysicalModel(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12),
                  child: CachedImage(
                    url: item.article.author.coverImage.dynamicUrl,
                    width: 24,
                    height: 24,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                Container(
                  width: 90,
                  child: Text(
                    item.article.author.nickName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
            Row(
              textDirection: TextDirection.ltr,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.thumb_up,
                  size: 12,
                  color: Colors.grey,
                ),
                SizedBox(width: 4,),
                // 如果你的Text在Row中, 你需要使用 Expanded:
                Text(
                  item.article.likeCount.toString(),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 10),
                )
              ],
            )
          ],
        ));
  }

  Widget get itemImage {
    return Expanded(
      child: Stack(
        children: [
          FractionallySizedBox(
            widthFactor: 1,
            child: CachedImage(
              fit: BoxFit.cover,
              url: item.article.images[0].dynamicUrl,
            ),
          ),
          Positioned(
            left: 8,
            bottom: 8,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, right: 10),
              height: 20,
              decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    size: 12,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  LimitedBox(
                    maxWidth: 130,
                    child: Text(
                      _poiName(),
                      maxLines: 1,
                      style: TextStyle(color: Colors.white, fontSize: 10),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
