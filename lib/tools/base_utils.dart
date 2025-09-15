import 'dart:convert';

class JCJiamiU {



  //加密：“data”：原始字符串；“code”：需求文档标题前的项目编号
  static String encrypt(String data, int code) {
    final ziji = utf8.encode(data);
    List<int> xorList = [];
    for (int i = 0; i < ziji.length; i++) {
      xorList.add(ziji[i] ^ code);
    }
    return base64.encode(xorList);
  }

  //解密：“data”：加密字符串；“code”：需求文档标题前的项目编号
  static String decrypt(String data, int code) {
    final decccccc = base64.decode(data);
    final decccccc2 = decccccc.toList();
    List<int> xorList = [];
    for (int i = 0; i < decccccc2.length; i++) {
      xorList.add(decccccc2[i] ^ code);
    }
    return utf8.decode(xorList);
  }

}


void main(){
  // String max = JcBaseUtils.encrypt("MWJzhnEPtKqxLKRLAlVrTyQfO2VxWZWtVx_SzTWC_MgoZL7kTKNt9t3M_OgIZ24nBXRXxVd9ogQEp7616TWf3C", 117);
  // String fengkong = JcBaseUtils.encrypt("MFwwDQYJKoZIhvcNAQEBBQADSwAwSAJBAMYl4KczbxQYcRCOgSH0lzRtfuI/jffXOXpHUXRVm3CRiyNL4M5U0Vy3qC+HO64/a1ZZ2FFcKLG69oOvUkCuMr0CAwEAAQ==", 117);
  // print("==encrypt=:$fengkong");
  // String dd = JcBaseUtils.decrypt(fengkong,117);
  // print("==decrypt=:$dd");
}