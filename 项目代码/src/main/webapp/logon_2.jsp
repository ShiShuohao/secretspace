<%--用户注册界面2 性别、生日、地区、密保问题--%>
<%@ page import="com.dao.FindpsdDao" %>
<%@ page import="com.pojo.Findpsd" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <link rel="icon" type="image/x-icon" href="resources/image/icon/favicon.ico">
    <title>logon</title>
    <style>
        @font-face {
            font-family: "PingFang";
            src: url(resources/font/PingFang.ttf);
        }
        body,input,select{
            font-family: PingFang;
        }
    </style>
    <script src="js/jquery-3.6.0.js"></script>
    <style>
        #input_submit{
            position: absolute;
            top: 75%;
            left: 50%;
            transform: translate(-50%,-50%);
            box-shadow: 0 1px 0 0 #f0f7fa;
            background: #33bdef linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
            border-radius:6px;
            border:1px solid #057fd0;
            display:inline-block;
            cursor:pointer;
            color:#ffffff;
            font-family:Arial;
            font-size:15px;
            font-weight:bold;
            padding:6px 24px;
            text-decoration:none;
            text-shadow:0 -1px 0 #5b6178;
            width: 51%;
        }
        #input_submit:hover{
            background: #019ad2 linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
        }
    </style>
</head>
<body style="background: url(resources/image/background/logon.jpeg) no-repeat center center fixed;-webkit-background-size: cover;-o-background-size: cover;background-size: cover;text-align: center;">
<div style="height: 500px;width: 450px;position: absolute;top: 50%;left: 50%;transform: translate(-50%,-50%);text-align: center;background-color: white;border-radius: 30px;opacity: 0.7;">
    <span style="position: absolute;font-size: 25px;color: #057fd0;top: 15%;left: 50%;transform: translate(-50%,-50%);">完&nbsp;善&nbsp;个&nbsp;人&nbsp;信&nbsp;息</span>
    <form action="logon_2" method="post" id="form">
        <div style="height: 25px;width: 250px;position: absolute;top: 32%;left: 50%;transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别</span>
            <input type="radio" name="sex" id="man" value="男" style="height: 15px;width: 15px;position: absolute;left: 47%"/><img src="resources/image/icon/man.png" alt="" style="height: 15px;width: 15px;position: absolute;left: 57%;top: 13%;">
            <input type="radio" name="sex" id="woman" value="女" style="height: 15px;width: 15px;position: absolute;left: 70%;"/><img src="resources/image/icon/woman.png" alt="" style="height: 20px;width: 20px;position: absolute;left: 79%;">
        </div>
        <div style="height: 25px;width: 250px;position: absolute;top: 40%;left: 50%;transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">生&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日</span>
            <input type="date" id="birthday" name="birthday" value="2000-01-01" style="height: 22px;width: 140px;position: absolute;left: 40%;">
        </div>
        <div style="height: 25px;width: 250px;position: absolute;top: 48%;left: 50%;transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;区</span>
            <select name="province" id="province" style="position: absolute;left: 40%;height: 22px;width: 65px;">
                <option>请选择</option>
            </select>
            <select name="city" id="city" style="position:absolute;right: 4%;height: 22px;width: 65px;">
                <option>请选择</option>
            </select>
        </div>
        <%
            List<Findpsd> findpsds = null;
            try {
                findpsds = FindpsdDao.selectFindpsd();
            } catch (Exception e) {
                e.printStackTrace();
            }
            request.setAttribute("questionList",findpsds);
        %>
        <div style="height: 250px;width: 250px;position: absolute;top: 78%;left: 50%;transform: translate(-50%,-50%);text-align: center;">
            <span style="position: absolute;left: 5%;">密保问题</span>
            <select name="question" id="question" style="position: absolute;width: 140px;height: 22px;left: 40%;">
                <option>请选择</option>
                <c:forEach var="question" items="${questionList}">
                    <option value="${question.question}">${question.question}</option>
                </c:forEach>
            </select><br>
            <span style="position: absolute;left: 5%;top: 15%;">答&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;案</span>
            <input type="text" name="answer" id="answer" placeholder="请输入答案" style="position:absolute;height: 22px;width: 140px;top: 15%;left: 40%;">
        </div>
        <span id="msg" style="color: red;font-size: 12px;position: absolute;transform: translate(-50%,-50%);top: 69%;left: 66%;"></span><br/>
        <input type="button" value="提交信息" id="input_submit" onclick="checkLogon()">
    </form>
    <script type="text/javascript">
        $(function () {
            var arr = [];
            arr['安徽'] = ['合肥', '安庆', '蚌埠', '亳州', '巢湖', '滁州', '阜阳', '贵池', '淮北', '淮化', '淮南', '黄山', '九华山', '六安', '马鞍山', '宿州', '铜陵', '屯溪', '芜湖', '宣城'];
            arr['北京'] = ['东城', '西城', '崇文', '宣武', '朝阳', '丰台', '石景山', '海淀', '门头沟', '房山', '通州', '顺义', '昌平', '大兴', '平谷', '怀柔', '密云', '延庆'];
            arr['重庆'] = ['万州', '涪陵', '渝中', '大渡口', '江北', '沙坪坝', '九龙坡', '南岸', '北碚', '万盛', '双挢', '渝北', '巴南', '黔江', '长寿', '綦江', '潼南', '铜梁', '大足', '荣昌', '壁山', '梁平', '城口', '丰都', '垫江', '武隆', '忠县', '开县', '云阳', '奉节', '巫山', '巫溪', '石柱', '秀山', '酉阳', '彭水', '江津', '合川', '永川', '南川'];
            arr['钓鱼岛'] = ['钓鱼岛'];
            arr['福建'] = ['福州', '福安', '龙岩', '南平', '宁德', '莆田', '泉州', '三明', '邵武', '石狮', '晋江', '永安', '武夷山', '厦门', '漳州'];
            arr['甘肃'] = ['兰州', '白银', '定西', '敦煌', '甘南', '金昌', '酒泉', '临夏', '平凉', '天水', '武都', '武威', '西峰', '嘉峪关', '张掖'];
            arr['广东'] = ['广州', '潮阳', '潮州', '澄海', '东莞', '佛山', '河源', '惠州', '江门', '揭阳', '开平', '茂名', '梅州', '清远', '汕头', '汕尾', '韶关', '深圳', '顺德', '阳江', '英德', '云浮', '增城', '湛江', '肇庆', '中山', '珠海'];
            arr['广西'] = ['南宁', '百色', '北海', '桂林', '防城港', '河池', '贺州', '柳州', '来宾', '钦州', '梧州', '贵港', '玉林'];
            arr['贵州'] = ['贵阳', '安顺', '毕节', '都匀', '凯里', '六盘水', '铜仁', '兴义', '玉屏', '遵义'];
            arr['海南'] = ['海口', '三亚', '五指山', '琼海', '儋州', '文昌', '万宁', '东方', '定安', '屯昌', '澄迈', '临高', '万宁', '白沙黎族', '昌江黎族', '乐东黎族', '陵水黎族', '保亭黎族', '琼中黎族', '西沙群岛', '南沙群岛', '中沙群岛'];
            arr['河北'] = ['石家庄', '保定', '北戴河', '沧州', '承德', '丰润', '邯郸', '衡水', '廊坊', '南戴河', '秦皇岛', '唐山', '新城', '邢台', '张家口'];
            arr['黑龙江'] = ['哈尔滨', '北安', '大庆', '大兴安岭', '鹤岗', '黑河', '佳木斯', '鸡西', '牡丹江', '齐齐哈尔', '七台河', '双鸭山', '绥化', '伊春'];
            arr['河南'] = ['郑州', '安阳', '鹤壁', '潢川', '焦作', '济源', '开封', '漯河', '洛阳', '南阳', '平顶山', '濮阳', '三门峡', '商丘', '新乡', '信阳', '许昌', '周口', '驻马店'];
            arr['香港'] = ['香港', '九龙', '新界'];
            arr['湖北'] = ['武汉', '恩施', '鄂州', '黄冈', '黄石', '荆门', '荆州', '潜江', '十堰', '随州', '武穴', '仙桃', '咸宁', '襄阳', '襄樊', '孝感', '宜昌'];
            arr['湖南'] = ['长沙', '常德', '郴州', '衡阳', '怀化', '吉首', '娄底', '邵阳', '湘潭', '益阳', '岳阳', '永州', '张家界', '株洲'];
            arr['江苏'] = ['南京', '常熟','常州', '海门', '淮安', '江都', '江阴', '昆山', '连云港', '南通', '启东', '沭阳', '宿迁', '苏州', '太仓', '泰州', '同里', '无锡', '徐州', '盐城', '扬州', '宜兴', '仪征', '张家港', '镇江', '周庄'];
            arr['江西'] = ['南昌', '抚州', '赣州', '吉安', '景德镇', '井冈山', '九江', '庐山', '萍乡', '上饶', '新余', '宜春', '鹰潭'];
            arr['吉林'] = ['长春', '白城', '白山', '珲春', '辽源', '梅河', '吉林', '四平', '松原', '通化', '延吉'];
            arr['辽宁'] = ['沈阳', '鞍山', '本溪', '朝阳', '大连', '丹东', '抚顺', '阜新', '葫芦岛', '锦州', '辽阳', '盘锦', '铁岭', '营口'];
            arr['澳门'] = ['澳门'];
            arr['内蒙古'] = ['呼和浩特', '阿拉善盟', '包头', '赤峰', '东胜', '海拉尔', '集宁', '临河', '通辽', '乌海', '乌兰浩特', '锡林浩特'];
            arr['宁夏'] = ['银川', '固原', '中卫', '石嘴山', '吴忠'];
            arr['青海'] = ['西宁', '德令哈', '格尔木', '共和', '海东', '海晏', '玛沁', '同仁', '玉树'];
            arr['山东'] = ['济南', '滨州', '兖州', '德州', '东营', '菏泽', '济宁', '莱芜', '聊城', '临沂', '蓬莱', '青岛', '曲阜', '日照', '泰安', '潍坊', '威海', '烟台', '枣庄', '淄博'];
            arr['上海'] = ['崇明', '黄浦', '卢湾', '徐汇', '长宁', '静安', '普陀', '闸北', '虹口', '杨浦', '闵行', '宝山', '嘉定', '浦东', '金山', '松江', '青浦', '南汇', '奉贤', '朱家角'];
            arr['山西'] = ['太原', '长治', '大同', '候马', '晋城', '离石', '临汾', '宁武', '朔州', '忻州', '阳泉', '榆次', '运城'];
            arr['陕西'] = ['西安', '安康', '宝鸡', '汉中', '渭南', '商州', '绥德', '铜川', '咸阳', '延安', '榆林'];
            arr['四川'] = ['成都', '巴中', '达州', '德阳', '都江堰', '峨眉山', '涪陵', '广安', '广元', '九寨沟', '康定', '乐山', '泸州', '马尔康', '绵阳', '眉山', '南充', '内江', '攀枝花', '遂宁', '汶川', '西昌', '雅安', '宜宾', '自贡', '资阳'];
            arr['台湾'] = ['台北', '基隆', '台南', '台中', '高雄', '屏东', '南投', '云林', '新竹', '彰化', '苗栗', '嘉义', '花莲', '桃园', '宜兰', '台东', '金门', '马祖', '澎湖', '其它'];
            arr['天津'] = ['天津','和平','东丽', '河东', '西青', '河西', '津南', '南开', '北辰', '河北', '武清', '红挢', '塘沽', '汉沽', '大港', '宁河', '静海', '宝坻', '蓟县'];
            arr['新疆'] = ['乌鲁木齐', '阿克苏', '阿勒泰', '阿图什', '博乐', '昌吉', '东山', '哈密', '和田', '喀什', '克拉玛依', '库车', '库尔勒', '奎屯', '石河子', '塔城', '吐鲁番', '伊宁'];
            arr['西藏'] = ['拉萨', '阿里', '昌都', '林芝', '那曲', '日喀则', '山南'];
            arr['云南'] = ['昆明', '大理', '保山', '楚雄', '大理', '东川', '个旧', '景洪', '开远', '临沧', '丽江', '六库', '潞西', '曲靖', '思茅', '文山', '西双版纳', '玉溪', '中甸', '昭通'];
            arr['浙江'] = ['杭州', '安吉', '慈溪', '定海', '奉化', '海盐', '黄岩', '湖州', '嘉兴', '金华', '临安', '临海', '丽水', '宁波', '瓯海', '平湖', '千岛湖', '衢州', '江山', '瑞安', '绍兴', '嵊州', '台州', '温岭', '温州', '余姚', '舟山'];
            arr['海外'] = ['美国', '英国', '法国', '瑞士', '澳洲', '新西兰', '加拿大', '奥地利', '韩国', '日本', '德国', '意大利', '西班牙', '俄罗斯', '泰国', '印度', '荷兰', '新加坡', '欧洲', '北美', '南美', '亚洲', '非洲', '大洋洲']
            for (var i in arr) {
                $('#province').append("<option value="+i+">"+i+"</option>");
            }
            $('#province').change(function () {
                $('#city').empty();
                $('#city').append("<option>请选择</option>");
                var val = $('#province').val();
                var values = arr[val];
                for(var v in values){
                    $('#city').append("<option value='"+values[v]+"'>"+values[v]+"</option>")
                }
            })
        })
    </script>
    <script>
        function checkLogon() {
            var man = document.getElementById("man").checked;
            var woman = document.getElementById("woman").checked;
            var province = $('#province').val();
            var city = $('#city').val();
            var question = $('#question').val();
            var answer = $('#answer').val();
            console.log(man);
            if (man===false&&woman===false) {
                $('#msg').html("请选择性别");
                return;
            }
            if (province==='请选择') {
                $('#msg').html("请选择省份");
                return;
            }
            if (city==='请选择'){
                $('#msg').html("请选择城市");
                return;
            }
            if (question==='请选择'){
                $('#msg').html("请选择密保问题");
                return;
            }
            if (isEmpty(answer)){
                $('#msg').html("答案不能为空");
                return;
            }
            $('#form').submit();
        }
        function isEmpty(str) {
            if (str === null || str.trim() === "") {
                return true;
            }
            return false;
        }
    </script>
    <span style="position: absolute;top: 95%;left: 26%;transform: translate(-50%,-50%);">&copy;&nbsp;www.secretspace.cn&nbsp;&nbsp;2021-</span>
</div>
</body>
</html>
