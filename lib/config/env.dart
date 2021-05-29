enum Env { DEV, STAGE, PROD }

//var aviationKey = "d24318-7a42aa";
var aviationKey = "fea522-148fac";
var weatherKey = "bGr_A_t2rFZ1_n3Vhi1iiXP544wdszLf1ZsxcC5a89Q";
//Your account is in the free demo mode until Jun 12, 2021. To buy a subscription plan, click here.
var airportDetails = "e4bc8ef8c3";

const Env env = Env.DEV;

//system
const base_url = <Env, String>{
  Env.DEV: "https://",
  Env.STAGE: "https://",
  Env.PROD: "https://"
};
