class DiscoverNoticeDetailModel {

  DiscoverNoticeDetailModel(
      this.NewsTitle,
      this.CreatedOn,
      this.Hits,
      this.ELinks,
      this.IsELinks,
      this.NewsContent,
      );
  /////////////

  String NewsTitle;
  String CreatedOn;
  int Hits;
  String ELinks;
  int IsELinks;
  String NewsContent;


}


/*
*       case readers = "Hits" // 点击量
        case title = "NewsTitle"  // 标题
        case createTime = "CreatedOn"   // 发布时间
        case content = "NewsContent"    // 文章内容
        case links = "ELinks"          // 外部链接网址
        case isLink = "IsELinks"       // 是否存在外部链接 1：是；0：否
*/