enum Env { DEV, STAGE, PROD }

const Env env = Env.DEV;

//system
const base_url = <Env, String>{
  Env.DEV: "https://",
  Env.STAGE: "https://",
  Env.PROD: "https://"
};