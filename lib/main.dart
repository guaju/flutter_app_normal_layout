import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 自定义布局'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static var imageUrls = [
    'https://img14.360buyimg.com/n7/jfs/t1/10599/10/10587/146787/5c63e3c0E3323bb2f/212da9c8e0637624.jpg',
    'https://img12.360buyimg.com/n7/jfs/t27433/228/2215049810/145022/240971e9/5bfbbfccN89a81d63.jpg',
    'https://img10.360buyimg.com/n7/jfs/t1/26242/30/6889/146787/5c63e4e9E0e7e5580/88da18f1a8c90552.jpg',
    'https://img11.360buyimg.com/n7/jfs/t27163/354/1454412463/213745/cb143ad4/5bc8229fN71106836.jpg',
    'https://img11.360buyimg.com/n7/jfs/t20725/120/260397741/314998/309e1894/5b078167N662ddd6f.jpg',
    'https://img13.360buyimg.com/n7/jfs/t1/15476/12/6790/236053/5c623217E01030e36/a0b27810a97b9b45.jpg',
    'https://img11.360buyimg.com/n7/jfs/t20992/243/566995296/217645/66f4fbf7/5b115097N63500501.jpg',
    'https://img12.360buyimg.com/n7/jfs/t1/25326/16/6249/77505/5c499b5cE16cda976/4441c14443d98754.jpg',
    'https://img13.360buyimg.com/n7/jfs/t1/24350/7/194/248202/5c07bf08E31e95048/5500d487160b3a6e.jpg',
    'https://img13.360buyimg.com/n7/jfs/t26743/103/1729821154/228380/3b20bf70/5bebd2cdNabea9166.jpg',
    'https://img10.360buyimg.com/n7/jfs/t1/11315/33/7081/335978/5c4abaa7E31539753/0fed7cac36dae7d9.jpg',
    'https://img10.360buyimg.com/n7/jfs/t1/23839/33/6435/189673/5c53db4aE1eb567ac/a10335cdc5cf65fb.jpg'
  ];
  static var goodsTitles = [
    '惠普（HP）暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1050Ti 4G独显 IPS FHD）',
    '联想Lenovo拯救者Y7000 15.6英寸游戏笔记本电脑(英特尔酷睿i5-8300H 8G 512G SSD GTX1050Ti 72% NTSC)',
    '惠普（HP）暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1050Ti 4G独显 144Hz IPS FHD）',
    '联想(Lenovo)拯救者Y7000 15.6英寸游戏笔记本电脑(英特尔酷睿i5-8300H 8G 512G SSD GTX1050 黑)',
    '小米(MI)15.6英寸轻薄窄边框游戏笔记本电脑（i7标压 16G 1T+256G GTX1060 6G显存 创新冷酷散热系统）深空灰',
    '华硕(ASUS) 飞行堡垒6 15.6英寸窄边框游戏笔记本电脑(i5-8300H 8G 256GSSD+1T GTX1050Ti 4G IPS)火陨红黑',
    '惠普（HP）暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1060 6G独显 四区背光键盘 IPS）',
    '联想(Lenovo)拯救者Y7000P英特尔酷睿 i7 15.6英寸游戏笔记本电脑(i7-8750H 8G 512G SSD GTX1060 144Hz黑)',
    '戴尔DELL游匣G3 15.6英寸英特尔酷睿i5游戏笔记本电脑(i5-8300H 8G 128G 1T GTX1050Ti 4G独显 72%NTSC IPS)',
    '机械革命(MECHREVO)Z2 Air 72%IPS 1.82Kg 15.6英寸窄边框游戏笔记本i7-8750H 8G 512GSSD GTX1050Ti Office',
    '联想(Lenovo)拯救者Y7000 15.6英寸高色域版游戏笔记本电脑(i7-8750H 8G 512G SSD GTX1050Ti 72%NTSC 黑)',
    '惠普（HP）暗影精灵4代 15.6英寸游戏笔记本电脑（i5-8300H 8G 128G+1TB GTX1060 6G 144Hz G-Sync IPS）'
  ];
  static List<Goods> list = new List();

  static Widget _pd(Widget w, {double l, double t, double r, double b}) {
    return Padding(
        padding: EdgeInsets.fromLTRB(l ?? 0, t ?? 0, r ?? 0, b ?? 0), child: w);
  }

  static Widget _pda(Widget w, double a) {
    return Padding(padding: EdgeInsets.all(a), child: w);
  }

  var listview = new ListView.builder(
    itemBuilder: (BuildContext context, int index) {
      var jdItem =
      Row(
          children: <Widget>[_leftImage(index),
          Expanded(child: _rightColumn(index),)
          ],
          crossAxisAlignment: CrossAxisAlignment.start);
      return Column(children: <Widget>[jdItem,Divider(height: 1,)],);
    },
    itemCount: goodsTitles.length,
  );

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < goodsTitles.length; i++) {
      list.add(new Goods(
          imageUrls[i],
          goodsTitles[i],
          ['Intel i7标准电压版', '内存8G'].toList(),
          '¥8888.88',
          ['秒杀', '分期免息'],
          88888,
          '100%好评',
          '京东自营官方旗舰店'));
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(child: listview),
    );
  }

  static Widget _leftImage(int index) {
    var image = new Image(
      image: NetworkImage(imageUrls[index]),
      width: 150.0,
      height: 150.0,
    );
    return _pd(image, l: 3, t: 5, r: 5);
  }

  static Widget _rightColumn(int index) {

    var titleStyle = TextStyle(color: Colors.black, fontSize: 20.0);
    var tagStyle =
    TextStyle(color: Color.fromARGB(255, 100, 100, 100), fontSize: 10.0);
    var priceStyle = TextStyle(
        color: Colors.red, fontSize: 20.0, fontWeight: FontWeight.w600);
    var title = Text(goodsTitles[index], style: titleStyle,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,);
    var boxd=BoxDecoration(
      color:Color.fromARGB(255, 200, 200, 200),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    );

    //第二排 tab 标签
    var tag =Row(children: list[index].goodstags.map((tag) {
          return Padding(
              child:Container(
                  child:Text(tag,style: tagStyle),
                  padding: EdgeInsets.fromLTRB(4,2,4,2),
                  decoration: boxd,),
              padding:EdgeInsets.fromLTRB(3.0,0,0,0));}).toList(),
              );
    //第三排 价格 及 活动
    var price = Text(list[index].price, style: priceStyle);
    var boxRed=BoxDecoration(
      color: Colors.transparent,
      shape: BoxShape.rectangle,
      border: new Border.all(color: Colors.red,width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(10.0))
    );
    var saleTags =Row(children: list[index].saleTags.map((tag) {
      return Padding(
          child:Container(
            child:Text(tag,style: tagStyle),
            padding: EdgeInsets.fromLTRB(4,1,4,1),
            decoration: boxRed,),
          padding:EdgeInsets.fromLTRB(3.0,0,0,0));}).toList(),
    );
    var priceRow=Row(children: <Widget>[price,saleTags]);
    //第四排
    var commentStyle=TextStyle(fontSize: 12,color: Color.fromARGB(255, 100 , 100, 100));
    var commentRow=Row(children: <Widget>[Text(list[index].commentCount.toString()+'条评论',style: commentStyle),_pd(Text(list[index].commentRates),l:3)]);
    //第五排
    var shopStyle=TextStyle(fontSize: 14,color: Color.fromARGB(255, 100 , 100, 100));
    var enterStyle=TextStyle(fontSize: 14,color: Colors.black);
    var shopText=new Text(list[index].shopName,style: shopStyle);
    var enterShop=new FlatButton(onPressed: null, child: Text('进店 >',style: enterStyle,));
    var shop=new Row(children: <Widget>[shopText,enterShop],);

    return new Column(
      children: <Widget>[title, _pd(tag,t:10),_pd(priceRow,t:10) ,_pd(commentRow,t:10),_pd(shop,t:10)],
    crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}

class Goods {
  String imageUrl;
  String goodsTitle;
  List<String> goodstags;
  String price;
  List<String> saleTags;
  int commentCount;
  String commentRates;
  String shopName;

  Goods(this.imageUrl, this.goodsTitle, this.goodstags, this.price,
      this.saleTags, this.commentCount, this.commentRates, this.shopName);
}
