class AppUrl {

static const String baseUrl = 'https://sale-hunter.herokuapp.com/api/v1/';

static const String signin = baseUrl + 'users/auth/signin';
static const String getuser = baseUrl + 'users';
static const String signup = baseUrl + 'users/auth/signup';
static const String forgotPassword = baseUrl + 'users/verifyEmail';
static const String updatePassword = baseUrl + 'users/updatePassword/';
static const String updateUser = baseUrl + 'users' ;
static const String createStore = baseUrl + 'stores/' ;
static const String createProduct = baseUrl + 'stores/' ;
static const String getProduct = baseUrl +'products/';
static const String deleteProduct = baseUrl +'products/'  ;
static const String updateProduct = baseUrl +'products/';

}