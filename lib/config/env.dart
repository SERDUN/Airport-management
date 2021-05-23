enum Env { DEV, STAGE, PROD }

var aviationKey = "fab70f-dbd351-b5972d-d418c6-073003";
var weatherKey = "bGr_A_t2rFZ1_n3Vhi1iiXP544wdszLf1ZsxcC5a89Q";

const Env env = Env.DEV;

//system
const base_url = <Env, String>{
  Env.DEV: "https://",
  Env.STAGE: "https://",
  Env.PROD: "https://"
};
