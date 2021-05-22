enum Env { DEV, STAGE, PROD }

var aviationKey = "fab70f-dbd351-b5972d-d418c6-073003";

const Env env = Env.DEV;

//system
const base_url = <Env, String>{
  Env.DEV: "https://",
  Env.STAGE: "https://",
  Env.PROD: "https://"
};
