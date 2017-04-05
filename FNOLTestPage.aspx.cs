namespace fnol
{
    using Mitchell.Platform.CoreService.RIStringCache;
    using System;

    public partial class FNOLTestPage : System.Web.UI.Page
    {
        const string cacheVersion = "mockservice";
        const string initiateFnolProcess = "InitiateFnolProcess";
        const string ProcessFnolPackage = "ProcessFnolPackage";
        const string SearchAppointments = "SearchAppointments";
        const string BookAppointment = "BookAppointment";


        /// <summary>
        /// UploadXML in string string Cache
        /// </summary>
        /// <param name="companyCode"></param>
        /// <param name="userId"></param>
        /// <param name="fnolParametersXml"></param>
        /// <param name="serviceName"></param>
        private static void UploadXML(string companyCode, string userId, string fnolParametersXml, string serviceName)
        {
            string message = string.Empty;
            string zippedfnolXmlString = string.Empty;
            string stringCachekey = string.Empty;
            try
            {
                if (!string.IsNullOrEmpty(companyCode) && !string.IsNullOrEmpty(fnolParametersXml))
                {
                    //creating string cache key
                    stringCachekey = companyCode.ToUpper() + "_" + userId.ToUpper() + "_" + serviceName.ToUpper();
                    StringCache stringCache = new StringCache();
                    zippedfnolXmlString = FNOLHelper.GZip(fnolParametersXml);
                    stringCache.SetString(stringCachekey, cacheVersion, zippedfnolXmlString);
                }
                else
                    throw new Exception("Either Company Code or User Id is empty.");
            }
            catch (Exception)
            {
                throw;
            }

        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Upload XML Service
        /// </summary>
        /// <param name="serviceName"></param>
        /// <param name="fnolParametersXml"></param>
        /// <param name="companyCode"></param>
        /// <returns></returns>
        [System.Web.Services.WebMethod]
        public static string UploadXMLService(string companyCode, string userId, string fnolInitiateFnolProcessXml, string fnolProcessFnolPackageXml, string fnolSearchAvailableAppointmentsXml, string fnolBookAppointmentXml)
        {
            string message = string.Empty;
            try
            {
                if (!string.IsNullOrEmpty(fnolInitiateFnolProcessXml) && !string.IsNullOrWhiteSpace(fnolInitiateFnolProcessXml))
                    UploadXML(companyCode, userId, fnolInitiateFnolProcessXml, initiateFnolProcess); //for “Initiate fnol process service.”
                if (!string.IsNullOrEmpty(fnolProcessFnolPackageXml) && !string.IsNullOrWhiteSpace(fnolProcessFnolPackageXml))
                    UploadXML(companyCode, userId, fnolProcessFnolPackageXml, ProcessFnolPackage); //for “Process fnol package.” 
                if (!string.IsNullOrEmpty(fnolSearchAvailableAppointmentsXml) && !string.IsNullOrWhiteSpace(fnolSearchAvailableAppointmentsXml))
                    UploadXML(companyCode, userId, fnolSearchAvailableAppointmentsXml, SearchAppointments);//for “Search available appointments.” 
                if (!string.IsNullOrEmpty(fnolBookAppointmentXml) && !string.IsNullOrWhiteSpace(fnolBookAppointmentXml))
                    UploadXML(companyCode, userId, fnolBookAppointmentXml, BookAppointment); //for “Book appointment service.” 
            }
            catch (Exception ex)
            {
                message = ex.Message;
            }

            return message;
        }

        [System.Web.Services.WebMethod]
        public static string GetBrowserPreferredLanguage()
        {
           string language = System.Web.HttpContext.Current.Request.UserLanguages[0];
           return language;
        }

    }
}