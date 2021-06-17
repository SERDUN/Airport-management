enum URLS { NEARBY_AIRPORTS, DETAILS_AIRPORT, WEATHER }

//var aviationKey = "d24318-7a42aa";
var aviationKey = "235ba8-7ffa37";
var weatherKey = "bGr_A_t2rFZ1_n3Vhi1iiXP544wdszLf1ZsxcC5a89Q";
//Your account is in the free demo mode until Jun 12, 2021. To buy a subscription plan, click here.
var airportDetailsKey = "704c51d135";
var airportDetailsSecret = "455290521c81d08";


//system
const base_url = <URLS, String>{
  URLS.NEARBY_AIRPORTS: "http://aviation-edge.com/v2/public",
  URLS.DETAILS_AIRPORT: "https://www.air-port-codes.com/api/v1/",
  URLS.WEATHER: "https://avwx.rest/api"
};
