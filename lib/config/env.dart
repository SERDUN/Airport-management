enum Env { DEV, STAGE, PROD }

//var aviationKey = "d24318-7a42aa";
 var aviationKey = "fea522-148fac";
var weatherKey = "bGr_A_t2rFZ1_n3Vhi1iiXP544wdszLf1ZsxcC5a89Q";

const Env env = Env.DEV;

//system
const base_url = <Env, String>{
  Env.DEV: "https://",
  Env.STAGE: "https://",
  Env.PROD: "https://"
};
