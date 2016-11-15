<%@ Page Title="Fincart" Language="C#" MasterPageFile="~/Website.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<!------------------------------skrollr code starts------------------------>
<link rel="stylesheet" href="skrollr/css/main.css">
<script src="skrollr/js/vendor/modernizr-2.7.1.min.js"></script>
<!------------------------------skrollr code ends-------------------------->

    <script type = "text/javascript">
            function SetTarget() {
                document.forms[0].target = "_blank";
            }
    </script>
    <!-- -----------------------------------start slider -->
	 <div class="wrap">
        <div class="slider">
        <div>
        <h1>Your Investment Plan Selfie (#IPSelfie)</h1>
        </div>
        <h2>Get your customized Investment Plan in just few clicks.</h2>
        <div class="clear"></div>
        <!--<div class="dropdown11">
            <asp:UpdatePanel ID="homeDD" runat="server">
            <ContentTemplate> 
                <asp:DropDownList ID="DDWorkType" runat="server" Width="169px" OnSelectedIndexChanged="DDWorkType_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Value="0">I would like to</asp:ListItem>
                    <asp:ListItem Value="Plan">Plan</asp:ListItem>
                    <asp:ListItem Value="Transact">Transact</asp:ListItem>
                    <asp:ListItem Value="Track">Track</asp:ListItem>
                </asp:DropDownList>
                <asp:DropDownList ID="DDWorkList" runat="server" Width="169px" >

                </asp:DropDownList>
                <asp:ImageButton ID="searchButton" runat="server" OnClientClick="SetTarget()" ImageUrl="images/search.png" OnClick="searchButton_Click" />            
             </ContentTemplate>
            </asp:UpdatePanel>
        </div>-->
        <h2>&nbsp;</h2>        
        <div style="text-align:center; padding-left:20px;" ><a href="Plan/instaSIP.aspx" target="_self" class="btn3b">Experience NOW!</a></div>
        </div>
	 </div>
<!-- -----------------------------------end slider -->
     
<!-- -----------------------------------start we featured in -->
	 <div class="main">
      	  <!--<h2 class="m_m">Where we feature</h2>-->
          <div class="m_3_3">
          We Featured In &nbsp; &nbsp;  
          <a href="Media.aspx"><img src="images/159670-grey.jpg"></a>
          <a href="Media.aspx"><img src="images/1598924-grey.jpg"></a> 
          <a href="Media.aspx"><img src="images/3677822-grey.jpg"></a> 
          <a href="Media.aspx"><img src="images/9720221-grey.jpg"></a> 
          <a href="Media.aspx"><img src="images/1432793505-grey.jpg"></a>          
          <a href="Media.aspx"><img src="images/4843033-grey.jpg"></a> 
          <!--<span>and many more...</span>-->
          </div>
          <!--<h2 class="m_m12"><a href="#">and many more...</a></h2>-->
     </div> 
<!-- -----------------------------------end we featured in -->


<!-- -----------------------------------start how it works -->
     <div class="main">
	     <div class="wrap2">
             <div class="m_3"> How it works </div>
             <!--<div class="m_3_1">Simple & easy DO-IT-YOURSELF platform <br>that helps you to achieve your goals confidently</div>-->             
             <div class="howitworks">
                <div class="howitworks1">
                    <div class="howitworks2">
                    <span><img src="images/howitworks1.png" width="87" height="87"></span>
                    </div>
                    <div class="howitworks3">
                    <p>Click & Get Your Customized Investment Plan</p>
                    </div>
                </div>
            
                <div class="howitworks11">
                    <div class="howitworks2">
                    <span><img src="images/howitworks2.png"></span>
                    </div>
                    <div class="howitworks3">
                    <p>Open Your Online Transaction Account</p>
                    </div>
                </div>
            
                <div class="howitworks111">
                    <div class="howitworks2">
                    <span><img src="images/howitworks3.png"></span>
                    </div>
                    <div class="howitworks3">
                    <p>Online Transaction Platform</p>
                    </div>
                </div>                                
                
                <div class="howitworks1111">
                    <div class="howitworks2">
                    <span><img src="images/howitworks5.png"></span>
                    </div>
                    <div class="howitworks3">
                    <p>Track Your Financial Progress</p>
                    </div>
                </div>
                
         	</div>
            <div class="clear"></div><br><br>
            <div style="font-size:12px; text-align:center; color:#595959;">If you need any assistance, we are just a call away<br> <i class="fa"></i> (91) 11 30018181. Happy to help!</div>
            <br>
            <div style="text-align:center; padding-left:20px;" ><a href="Plan/instaSIP.aspx" target="_self" class="btn3b">Get Started</a></div>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
            <p>&nbsp;</p>
		</div>
    </div>
<!-- -----------------------------------end how it works -->

<!-- -----------------------------------skrollr lady with cake code starts -->
    <div class="main-slide-2">            
        <main>
            <section id="slide-2">
                <div class="bcg" data-center="background-position:100% 0px;" data-bottom-top="background-position:100% 0px;" data-top-bottom="background-position: 100% -40px;" data-anchor-target="#slide-2">
                    <div class="hsContainer">&nbsp;</div>
                </div>
            </section>
        </main>
    </div>
     <div class="main-slide-2b">            
        <main>
        <img src="images/lady-chef-cake.jpg">
        </main>
    </div>
    <div class="main-slide-2c">            
        <main>
        <img src="images/lady-chef-cake1024.jpg">
        </main>
    </div>
<!-- -----------------------------------skrollr lady with cake code ends -->
    
<!-- -----------------------------------click option starts -->
     <div class="main">        
        <div class="m_3"><!--<span class="left_line3"></span>-->Click Option<!--<span class="right_line3"> </span>--></div>
		<div class="selectoption">
            <div class="selectoption1">
                <div class="selectoption2"><span><a href="Plan/InstaSIP.aspx"><img src="images/insta-SystematicInvestmentPlan.jpg"></a></span></div>
                <div class="selectoption3"><p>We can choose for you, you confirm, you transact</p></div>
            </div>
            <div class="selectoption11">
                <div class="selectoption2"><span><a href="SFinancialPlanning/FPSelfie.aspx"><img src="images/financialplan-free.jpg"></a></span></div>
                <div class="selectoption3"><p>You make a plan, we suggest our researched pool, you confirm, you transact </p></div>
            </div>
            <div class="selectoption111">
                <div class="selectoption2"><span><a href="#" class="md-trigger" data-modal="Modal-CallMe" ><img src="images/fully-asisted-paid.jpg"></a></span></div>
                <div class="selectoption3"><p>We do the research, we suggest, we discuss, you approve, you transact with the help of a dedicated Online Financial Planner & Investment Advisor.</p></div>
            </div>
		</div>
        <%--<div class="clear"></div>  
         <br>
            <div style="text-align:center; padding-left:20px;""><a href="Plan/Login.aspx" target="_blank" class="btn3b">Get Started</a></div>
         <br />--%>
	  </div>
<!-- -----------------------------------click option ends -->

        
<!-- -----------------------------------skrollr fincart advantage code starts -->
    <div class="main-slide-3">        
        <main>
            <section id="slide-3">
                <div class="bcg" data-center="background-position:100% 0px;" data-bottom-top="background-position:100% 0px;" data-top-bottom="background-position: 100% -40px;" data-anchor-target="#slide-3">
                    <div class="hsContainer">
                        <div class="hsContent">
                            <div data-top="opacity: 0.8;" data-bottom="opacity: 1;">
                                <h2>Fincart#IPSelfieAdvantage</h2>                                
                                    A comprehensive FREE Robo-Advisory Platform that helps you do 3 things<br /><br />  
                                                                      
                                    <div class="s-row">
                                        <div class="s-col-sm-2"><img src="images/plan.png" /></div>
                                        <div class="s-col-sm-10">Financial Planning</div>
                                    </div>
                                    <div class="s-row">
                                        <div class="s-col-sm-2"><img src="images/invest.png" /></div>
                                        <div class="s-col-sm-10">Online Transaction Account – you can buy all mutual funds online</div>
                                    </div>
                                    <div class="s-row">
                                        <div class="s-col-sm-2"><img src="images/prosper.png" /></div>
                                        <div class="s-col-sm-10">Track the progress of all your Financial Goals</div>
                                    </div>                                                                                                               
                                    
                                <br /><br />
                                <p>All you need is 2 minutes to make Financial Progress.</p><br>
                                <!--<p><span class="bgBlack">First Company to record & share audio-link</span></p><br>
                                <p><span class="bgBlack">Managing Money Simplified</span></p>--> 
                           </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
    <div class="main-slide-3b">            
        <main>
        <img src="images/lady-headphone.jpg">
        </main>
    </div>
    <div class="main-slide-3c">            
        <main>
        <img src="images/lady-headphone1024.jpg">
        </main>
    </div>
<!-- -----------------------------------skrollr fincart advantage code ends -->
    
<!-- -----------------------------------its simple starts -->
     <div class="main">        
		<div id="sochkar-heading"><!--<span class="left_line3"></span>-->Paperless Online Transaction<!--<span class="right_line3">--></span></div>
		<div class="sochkar">
            	<div class="sochkar1">
                <div class="sochkar2">
                <span><img src="images/open-account.png"></span>
                </div>
                <div class="sochkar3">
                    <p>Fill the form and submit the KYC documents</p>
                </div>
            	</div>
            
                <div class="sochkar11">
                <div class="sochkar2">
                <span><img src="images/select-funds.png"></span>
                </div>
                <div class="sochkar3">
                    <p>Selected researched investment choices that’s best matched to your need</p>
                </div>
                </div>
            
                <div class="sochkar111">
                <div class="sochkar2">
                <span><img src="images/transact.png"></span>
                </div>
                <div class="sochkar3">
                    <p>Simply click to invest </p>
                </div>
                </div>
		</div>
         <br>
            <div style="text-align:center; padding-left:20px;""><a href="Plan/online-account-open.aspx" class="btn3b">Get Started</a></div>
         <br />
    </div>
        <div class="clear"></div>
<!-- -----------------------------------its simple ends -->

<!-- -----------------------------------lady with selfie starts -->
	<div class="main-slide-4"> 
        <main>
            <section id="slide-4">
                <div class="bcg" data-center="background-position:100% 0px;" data-bottom-top="background-position:100% 0px;" data-top-bottom="background-position: 100% -40px;" data-anchor-target="#slide-4">
                    <div class="hsContainer">
                        <div class="hsContent">
                            <div data-top="opacity: 0.8;" data-bottom="opacity: 1;">
                                <!--<h2>Fincart Advantage</h2>
                                <p><span class="bgBlack">FREE Financial Plan</span></p><br>
                                <p><span class="bgBlack">First Company to record & share audio-link</span></p><br>
                                <p><span class="bgBlack">Managing Money Simplified</span></p>--> 
                           </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
    <div class="main-slide-4b">            
        <main>
        <img src="images/lady-selfie.jpg">
        </main>
    </div>
    <div class="main-slide-4c">            
        <main>
        <img src="images/lady-selfie1024.jpg">
        </main>
    </div>
<!-- -----------------------------------lady with selfie ends -->

   
<!-- -----------------------------------Portfolio Tracker starts-->
        <%--<div id="portfoliotracker-heading"><!--<span class="left_line3"></span>-->Portfolio Tracker<!--<span class="right_line3"> </span>--></div>
		<div class="portfolio-tracker">
        	<img src="images/transact-1.jpg">
        </div>--%>
    <div id="portfoliotracker-heading">Portfolio Tracker</div>
        <div class="main-slide-3">        
        <main>
            <section id="slide-5">
                <div class="bcg" data-center="background-position:100% 0px;" data-bottom-top="background-position:100% 0px;" data-top-bottom="background-position: 100% -40px;" data-anchor-target="#slide-5">
                    <div class="hsContainer">
                        <div class="hsContent">
                            <div data-top="opacity: 0.8;" data-bottom="opacity: 1;">
                                <%--<h2>Portfolio Tracker</h2>--%>
                                
                                    <h3>This feature enables users to Track Progress of their Financial Goals.</h3>
                           </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </div>
<!-- -----------------------------------Portfolio Tracker ends-->
        

<!-- -----------------------------------its secure starts-->
     <div class="main">        
        <div id="itssecure-heading">It’s Secure</span></div>
        <div class="itssecure">
            <div class="itssecure1">
                <div class="itssecure2">
                <span><img src="images/secure1.jpg"></span>
                </div>
                <div class="itssecure3">
                    <p>Your personal data is safe and secure</p>
                </div>
            </div>
        
            <div class="itssecure11">
                <div class="itssecure2">
                <span><img src="images/secure2.jpg"></span>
                </div>
                <div class="itssecure3">
                    <p>Customer ID and password encryption secure </p>
                </div>
            </div>
        
            <div class="itssecure111">
                <div class="itssecure2">
                <span><img src="images/secure3.jpg"></span>
                </div>
                <div class="itssecure3">
                    <p>Confidential as per our strict privacy policy </p>
                </div>
            </div>
		</div>
     </div>
        <div class="clear"></div>
        <div class="itssecure2nd">
        <img src="images/bank-amc.jpg">
            <p>Money is transferred from your bank account directly to the fund house<br />and back to your bank account on redemption</p>
        </div>
    <div class="clear"></div>  
         <br>
            <div style="text-align:center; padding-left:20px;""><a href="http://fincart.my-portfolio.in" target="_blank" class="btn3b">Track Portfolio</a></div>
         <br />
<!-- -----------------------------------its secure ends-->

     <script type="text/javascript">

         if (window.innerWidth > 1024) {

             /*!
  * imagesLoaded PACKAGED v3.0.4
  * JavaScript is all like "You images are done yet or what?"
  * MIT License
  */


             /*!
              * EventEmitter v4.2.4 - git.io/ee
              * Oliver Caldwell
              * MIT license
              * @preserve
              */

             (function () {


                 /**
                  * Class for managing events.
                  * Can be extended to provide event functionality in other classes.
                  *
                  * @class EventEmitter Manages event registering and emitting.
                  */
                 function EventEmitter() { }

                 // Shortcuts to improve speed and size

                 // Easy access to the prototype
                 var proto = EventEmitter.prototype;

                 /**
                  * Finds the index of the listener for the event in it's storage array.
                  *
                  * @param {Function[]} listeners Array of listeners to search through.
                  * @param {Function} listener Method to look for.
                  * @return {Number} Index of the specified listener, -1 if not found
                  * @api private
                  */
                 function indexOfListener(listeners, listener) {
                     var i = listeners.length;
                     while (i--) {
                         if (listeners[i].listener === listener) {
                             return i;
                         }
                     }

                     return -1;
                 }

                 /**
                  * Alias a method while keeping the context correct, to allow for overwriting of target method.
                  *
                  * @param {String} name The name of the target method.
                  * @return {Function} The aliased method
                  * @api private
                  */
                 function alias(name) {
                     return function aliasClosure() {
                         return this[name].apply(this, arguments);
                     };
                 }

                 /**
                  * Returns the listener array for the specified event.
                  * Will initialise the event object and listener arrays if required.
                  * Will return an object if you use a regex search. The object contains keys for each matched event. So /ba[rz]/ might return an object containing bar and baz. But only if you have either defined them with defineEvent or added some listeners to them.
                  * Each property in the object response is an array of listener functions.
                  *
                  * @param {String|RegExp} evt Name of the event to return the listeners from.
                  * @return {Function[]|Object} All listener functions for the event.
                  */
                 proto.getListeners = function getListeners(evt) {
                     var events = this._getEvents();
                     var response;
                     var key;

                     // Return a concatenated array of all matching events if
                     // the selector is a regular expression.
                     if (typeof evt === 'object') {
                         response = {};
                         for (key in events) {
                             if (events.hasOwnProperty(key) && evt.test(key)) {
                                 response[key] = events[key];
                             }
                         }
                     }
                     else {
                         response = events[evt] || (events[evt] = []);
                     }

                     return response;
                 };

                 /**
                  * Takes a list of listener objects and flattens it into a list of listener functions.
                  *
                  * @param {Object[]} listeners Raw listener objects.
                  * @return {Function[]} Just the listener functions.
                  */
                 proto.flattenListeners = function flattenListeners(listeners) {
                     var flatListeners = [];
                     var i;

                     for (i = 0; i < listeners.length; i += 1) {
                         flatListeners.push(listeners[i].listener);
                     }

                     return flatListeners;
                 };

                 /**
                  * Fetches the requested listeners via getListeners but will always return the results inside an object. This is mainly for internal use but others may find it useful.
                  *
                  * @param {String|RegExp} evt Name of the event to return the listeners from.
                  * @return {Object} All listener functions for an event in an object.
                  */
                 proto.getListenersAsObject = function getListenersAsObject(evt) {
                     var listeners = this.getListeners(evt);
                     var response;

                     if (listeners instanceof Array) {
                         response = {};
                         response[evt] = listeners;
                     }

                     return response || listeners;
                 };

                 /**
                  * Adds a listener function to the specified event.
                  * The listener will not be added if it is a duplicate.
                  * If the listener returns true then it will be removed after it is called.
                  * If you pass a regular expression as the event name then the listener will be added to all events that match it.
                  *
                  * @param {String|RegExp} evt Name of the event to attach the listener to.
                  * @param {Function} listener Method to be called when the event is emitted. If the function returns true then it will be removed after calling.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.addListener = function addListener(evt, listener) {
                     var listeners = this.getListenersAsObject(evt);
                     var listenerIsWrapped = typeof listener === 'object';
                     var key;

                     for (key in listeners) {
                         if (listeners.hasOwnProperty(key) && indexOfListener(listeners[key], listener) === -1) {
                             listeners[key].push(listenerIsWrapped ? listener : {
                                 listener: listener,
                                 once: false
                             });
                         }
                     }

                     return this;
                 };

                 /**
                  * Alias of addListener
                  */
                 proto.on = alias('addListener');

                 /**
                  * Semi-alias of addListener. It will add a listener that will be
                  * automatically removed after it's first execution.
                  *
                  * @param {String|RegExp} evt Name of the event to attach the listener to.
                  * @param {Function} listener Method to be called when the event is emitted. If the function returns true then it will be removed after calling.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.addOnceListener = function addOnceListener(evt, listener) {
                     return this.addListener(evt, {
                         listener: listener,
                         once: true
                     });
                 };

                 /**
                  * Alias of addOnceListener.
                  */
                 proto.once = alias('addOnceListener');

                 /**
                  * Defines an event name. This is required if you want to use a regex to add a listener to multiple events at once. If you don't do this then how do you expect it to know what event to add to? Should it just add to every possible match for a regex? No. That is scary and bad.
                  * You need to tell it what event names should be matched by a regex.
                  *
                  * @param {String} evt Name of the event to create.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.defineEvent = function defineEvent(evt) {
                     this.getListeners(evt);
                     return this;
                 };

                 /**
                  * Uses defineEvent to define multiple events.
                  *
                  * @param {String[]} evts An array of event names to define.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.defineEvents = function defineEvents(evts) {
                     for (var i = 0; i < evts.length; i += 1) {
                         this.defineEvent(evts[i]);
                     }
                     return this;
                 };

                 /**
                  * Removes a listener function from the specified event.
                  * When passed a regular expression as the event name, it will remove the listener from all events that match it.
                  *
                  * @param {String|RegExp} evt Name of the event to remove the listener from.
                  * @param {Function} listener Method to remove from the event.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.removeListener = function removeListener(evt, listener) {
                     var listeners = this.getListenersAsObject(evt);
                     var index;
                     var key;

                     for (key in listeners) {
                         if (listeners.hasOwnProperty(key)) {
                             index = indexOfListener(listeners[key], listener);

                             if (index !== -1) {
                                 listeners[key].splice(index, 1);
                             }
                         }
                     }

                     return this;
                 };

                 /**
                  * Alias of removeListener
                  */
                 proto.off = alias('removeListener');

                 /**
                  * Adds listeners in bulk using the manipulateListeners method.
                  * If you pass an object as the second argument you can add to multiple events at once. The object should contain key value pairs of events and listeners or listener arrays. You can also pass it an event name and an array of listeners to be added.
                  * You can also pass it a regular expression to add the array of listeners to all events that match it.
                  * Yeah, this function does quite a bit. That's probably a bad thing.
                  *
                  * @param {String|Object|RegExp} evt An event name if you will pass an array of listeners next. An object if you wish to add to multiple events at once.
                  * @param {Function[]} [listeners] An optional array of listener functions to add.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.addListeners = function addListeners(evt, listeners) {
                     // Pass through to manipulateListeners
                     return this.manipulateListeners(false, evt, listeners);
                 };

                 /**
                  * Removes listeners in bulk using the manipulateListeners method.
                  * If you pass an object as the second argument you can remove from multiple events at once. The object should contain key value pairs of events and listeners or listener arrays.
                  * You can also pass it an event name and an array of listeners to be removed.
                  * You can also pass it a regular expression to remove the listeners from all events that match it.
                  *
                  * @param {String|Object|RegExp} evt An event name if you will pass an array of listeners next. An object if you wish to remove from multiple events at once.
                  * @param {Function[]} [listeners] An optional array of listener functions to remove.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.removeListeners = function removeListeners(evt, listeners) {
                     // Pass through to manipulateListeners
                     return this.manipulateListeners(true, evt, listeners);
                 };

                 /**
                  * Edits listeners in bulk. The addListeners and removeListeners methods both use this to do their job. You should really use those instead, this is a little lower level.
                  * The first argument will determine if the listeners are removed (true) or added (false).
                  * If you pass an object as the second argument you can add/remove from multiple events at once. The object should contain key value pairs of events and listeners or listener arrays.
                  * You can also pass it an event name and an array of listeners to be added/removed.
                  * You can also pass it a regular expression to manipulate the listeners of all events that match it.
                  *
                  * @param {Boolean} remove True if you want to remove listeners, false if you want to add.
                  * @param {String|Object|RegExp} evt An event name if you will pass an array of listeners next. An object if you wish to add/remove from multiple events at once.
                  * @param {Function[]} [listeners] An optional array of listener functions to add/remove.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.manipulateListeners = function manipulateListeners(remove, evt, listeners) {
                     var i;
                     var value;
                     var single = remove ? this.removeListener : this.addListener;
                     var multiple = remove ? this.removeListeners : this.addListeners;

                     // If evt is an object then pass each of it's properties to this method
                     if (typeof evt === 'object' && !(evt instanceof RegExp)) {
                         for (i in evt) {
                             if (evt.hasOwnProperty(i) && (value = evt[i])) {
                                 // Pass the single listener straight through to the singular method
                                 if (typeof value === 'function') {
                                     single.call(this, i, value);
                                 }
                                 else {
                                     // Otherwise pass back to the multiple function
                                     multiple.call(this, i, value);
                                 }
                             }
                         }
                     }
                     else {
                         // So evt must be a string
                         // And listeners must be an array of listeners
                         // Loop over it and pass each one to the multiple method
                         i = listeners.length;
                         while (i--) {
                             single.call(this, evt, listeners[i]);
                         }
                     }

                     return this;
                 };

                 /**
                  * Removes all listeners from a specified event.
                  * If you do not specify an event then all listeners will be removed.
                  * That means every event will be emptied.
                  * You can also pass a regex to remove all events that match it.
                  *
                  * @param {String|RegExp} [evt] Optional name of the event to remove all listeners for. Will remove from every event if not passed.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.removeEvent = function removeEvent(evt) {
                     var type = typeof evt;
                     var events = this._getEvents();
                     var key;

                     // Remove different things depending on the state of evt
                     if (type === 'string') {
                         // Remove all listeners for the specified event
                         delete events[evt];
                     }
                     else if (type === 'object') {
                         // Remove all events matching the regex.
                         for (key in events) {
                             if (events.hasOwnProperty(key) && evt.test(key)) {
                                 delete events[key];
                             }
                         }
                     }
                     else {
                         // Remove all listeners in all events
                         delete this._events;
                     }

                     return this;
                 };

                 /**
                  * Alias of removeEvent.
                  *
                  * Added to mirror the node API.
                  */
                 proto.removeAllListeners = alias('removeEvent');

                 /**
                  * Emits an event of your choice.
                  * When emitted, every listener attached to that event will be executed.
                  * If you pass the optional argument array then those arguments will be passed to every listener upon execution.
                  * Because it uses `apply`, your array of arguments will be passed as if you wrote them out separately.
                  * So they will not arrive within the array on the other side, they will be separate.
                  * You can also pass a regular expression to emit to all events that match it.
                  *
                  * @param {String|RegExp} evt Name of the event to emit and execute listeners for.
                  * @param {Array} [args] Optional array of arguments to be passed to each listener.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.emitEvent = function emitEvent(evt, args) {
                     var listeners = this.getListenersAsObject(evt);
                     var listener;
                     var i;
                     var key;
                     var response;

                     for (key in listeners) {
                         if (listeners.hasOwnProperty(key)) {
                             i = listeners[key].length;

                             while (i--) {
                                 // If the listener returns true then it shall be removed from the event
                                 // The function is executed either with a basic call or an apply if there is an args array
                                 listener = listeners[key][i];

                                 if (listener.once === true) {
                                     this.removeListener(evt, listener.listener);
                                 }

                                 response = listener.listener.apply(this, args || []);

                                 if (response === this._getOnceReturnValue()) {
                                     this.removeListener(evt, listener.listener);
                                 }
                             }
                         }
                     }

                     return this;
                 };

                 /**
                  * Alias of emitEvent
                  */
                 proto.trigger = alias('emitEvent');

                 /**
                  * Subtly different from emitEvent in that it will pass its arguments on to the listeners, as opposed to taking a single array of arguments to pass on.
                  * As with emitEvent, you can pass a regex in place of the event name to emit to all events that match it.
                  *
                  * @param {String|RegExp} evt Name of the event to emit and execute listeners for.
                  * @param {...*} Optional additional arguments to be passed to each listener.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.emit = function emit(evt) {
                     var args = Array.prototype.slice.call(arguments, 1);
                     return this.emitEvent(evt, args);
                 };

                 /**
                  * Sets the current value to check against when executing listeners. If a
                  * listeners return value matches the one set here then it will be removed
                  * after execution. This value defaults to true.
                  *
                  * @param {*} value The new value to check for when executing listeners.
                  * @return {Object} Current instance of EventEmitter for chaining.
                  */
                 proto.setOnceReturnValue = function setOnceReturnValue(value) {
                     this._onceReturnValue = value;
                     return this;
                 };

                 /**
                  * Fetches the current value to check against when executing listeners. If
                  * the listeners return value matches this one then it should be removed
                  * automatically. It will return true by default.
                  *
                  * @return {*|Boolean} The current value to check for or the default, true.
                  * @api private
                  */
                 proto._getOnceReturnValue = function _getOnceReturnValue() {
                     if (this.hasOwnProperty('_onceReturnValue')) {
                         return this._onceReturnValue;
                     }
                     else {
                         return true;
                     }
                 };

                 /**
                  * Fetches the events object and creates one if required.
                  *
                  * @return {Object} The events storage object.
                  * @api private
                  */
                 proto._getEvents = function _getEvents() {
                     return this._events || (this._events = {});
                 };

                 // Expose the class either via AMD, CommonJS or the global object
                 if (typeof define === 'function' && define.amd) {
                     define('eventEmitter/EventEmitter', [], function () {
                         return EventEmitter;
                     });
                 }
                 else if (typeof module === 'object' && module.exports) {
                     module.exports = EventEmitter;
                 }
                 else {
                     this.EventEmitter = EventEmitter;
                 }
             }.call(this));

             /*!
              * eventie v1.0.3
              * event binding helper
              *   eventie.bind( elem, 'click', myFn )
              *   eventie.unbind( elem, 'click', myFn )
              */

             /*jshint browser: true, undef: true, unused: true */
             /*global define: false */

             (function (window) {



                 var docElem = document.documentElement;

                 var bind = function () { };

                 if (docElem.addEventListener) {
                     bind = function (obj, type, fn) {
                         obj.addEventListener(type, fn, false);
                     };
                 } else if (docElem.attachEvent) {
                     bind = function (obj, type, fn) {
                         obj[type + fn] = fn.handleEvent ?
                           function () {
                               var event = window.event;
                               // add event.target
                               event.target = event.target || event.srcElement;
                               fn.handleEvent.call(fn, event);
                           } :
                           function () {
                               var event = window.event;
                               // add event.target
                               event.target = event.target || event.srcElement;
                               fn.call(obj, event);
                           };
                         obj.attachEvent("on" + type, obj[type + fn]);
                     };
                 }

                 var unbind = function () { };

                 if (docElem.removeEventListener) {
                     unbind = function (obj, type, fn) {
                         obj.removeEventListener(type, fn, false);
                     };
                 } else if (docElem.detachEvent) {
                     unbind = function (obj, type, fn) {
                         obj.detachEvent("on" + type, obj[type + fn]);
                         try {
                             delete obj[type + fn];
                         } catch (err) {
                             // can't delete window object properties
                             obj[type + fn] = undefined;
                         }
                     };
                 }

                 var eventie = {
                     bind: bind,
                     unbind: unbind
                 };

                 // transport
                 if (typeof define === 'function' && define.amd) {
                     // AMD
                     define('eventie/eventie', eventie);
                 } else {
                     // browser global
                     window.eventie = eventie;
                 }

             })(this);

             /*!
              * imagesLoaded v3.0.4
              * JavaScript is all like "You images are done yet or what?"
              * MIT License
              */

             (function (window) {



                 var $ = window.jQuery;
                 var console = window.console;
                 var hasConsole = typeof console !== 'undefined';

                 // -------------------------- helpers -------------------------- //

                 // extend objects
                 function extend(a, b) {
                     for (var prop in b) {
                         a[prop] = b[prop];
                     }
                     return a;
                 }

                 var objToString = Object.prototype.toString;
                 function isArray(obj) {
                     return objToString.call(obj) === '[object Array]';
                 }

                 // turn element or nodeList into an array
                 function makeArray(obj) {
                     var ary = [];
                     if (isArray(obj)) {
                         // use object if already an array
                         ary = obj;
                     } else if (typeof obj.length === 'number') {
                         // convert nodeList to array
                         for (var i = 0, len = obj.length; i < len; i++) {
                             ary.push(obj[i]);
                         }
                     } else {
                         // array of single index
                         ary.push(obj);
                     }
                     return ary;
                 }

                 // --------------------------  -------------------------- //

                 function defineImagesLoaded(EventEmitter, eventie) {

                     /**
                      * @param {Array, Element, NodeList, String} elem
                      * @param {Object or Function} options - if function, use as callback
                      * @param {Function} onAlways - callback function
                      */
                     function ImagesLoaded(elem, options, onAlways) {
                         // coerce ImagesLoaded() without new, to be new ImagesLoaded()
                         if (!(this instanceof ImagesLoaded)) {
                             return new ImagesLoaded(elem, options);
                         }
                         // use elem as selector string
                         if (typeof elem === 'string') {
                             elem = document.querySelectorAll(elem);
                         }

                         this.elements = makeArray(elem);
                         this.options = extend({}, this.options);

                         if (typeof options === 'function') {
                             onAlways = options;
                         } else {
                             extend(this.options, options);
                         }

                         if (onAlways) {
                             this.on('always', onAlways);
                         }

                         this.getImages();

                         if ($) {
                             // add jQuery Deferred object
                             this.jqDeferred = new $.Deferred();
                         }

                         // HACK check async to allow time to bind listeners
                         var _this = this;
                         setTimeout(function () {
                             _this.check();
                         });
                     }

                     ImagesLoaded.prototype = new EventEmitter();

                     ImagesLoaded.prototype.options = {};

                     ImagesLoaded.prototype.getImages = function () {
                         this.images = [];

                         // filter & find items if we have an item selector
                         for (var i = 0, len = this.elements.length; i < len; i++) {
                             var elem = this.elements[i];
                             // filter siblings
                             if (elem.nodeName === 'IMG') {
                                 this.addImage(elem);
                             }
                             // find children
                             var childElems = elem.querySelectorAll('img');
                             // concat childElems to filterFound array
                             for (var j = 0, jLen = childElems.length; j < jLen; j++) {
                                 var img = childElems[j];
                                 this.addImage(img);
                             }
                         }
                     };

                     /**
                      * @param {Image} img
                      */
                     ImagesLoaded.prototype.addImage = function (img) {
                         var loadingImage = new LoadingImage(img);
                         this.images.push(loadingImage);
                     };

                     ImagesLoaded.prototype.check = function () {
                         var _this = this;
                         var checkedCount = 0;
                         var length = this.images.length;
                         this.hasAnyBroken = false;
                         // complete if no images
                         if (!length) {
                             this.complete();
                             return;
                         }

                         function onConfirm(image, message) {
                             if (_this.options.debug && hasConsole) {
                                 console.log('confirm', image, message);
                             }

                             _this.progress(image);
                             checkedCount++;
                             if (checkedCount === length) {
                                 _this.complete();
                             }
                             return true; // bind once
                         }

                         for (var i = 0; i < length; i++) {
                             var loadingImage = this.images[i];
                             loadingImage.on('confirm', onConfirm);
                             loadingImage.check();
                         }
                     };

                     ImagesLoaded.prototype.progress = function (image) {
                         this.hasAnyBroken = this.hasAnyBroken || !image.isLoaded;
                         // HACK - Chrome triggers event before object properties have changed. #83
                         var _this = this;
                         setTimeout(function () {
                             _this.emit('progress', _this, image);
                             if (_this.jqDeferred) {
                                 _this.jqDeferred.notify(_this, image);
                             }
                         });
                     };

                     ImagesLoaded.prototype.complete = function () {
                         var eventName = this.hasAnyBroken ? 'fail' : 'done';
                         this.isComplete = true;
                         var _this = this;
                         // HACK - another setTimeout so that confirm happens after progress
                         setTimeout(function () {
                             _this.emit(eventName, _this);
                             _this.emit('always', _this);
                             if (_this.jqDeferred) {
                                 var jqMethod = _this.hasAnyBroken ? 'reject' : 'resolve';
                                 _this.jqDeferred[jqMethod](_this);
                             }
                         });
                     };

                     // -------------------------- jquery -------------------------- //

                     if ($) {
                         $.fn.imagesLoaded = function (options, callback) {
                             var instance = new ImagesLoaded(this, options, callback);
                             return instance.jqDeferred.promise($(this));
                         };
                     }


                     // --------------------------  -------------------------- //

                     var cache = {};

                     function LoadingImage(img) {
                         this.img = img;
                     }

                     LoadingImage.prototype = new EventEmitter();

                     LoadingImage.prototype.check = function () {
                         // first check cached any previous images that have same src
                         var cached = cache[this.img.src];
                         if (cached) {
                             this.useCached(cached);
                             return;
                         }
                         // add this to cache
                         cache[this.img.src] = this;

                         // If complete is true and browser supports natural sizes,
                         // try to check for image status manually.
                         if (this.img.complete && this.img.naturalWidth !== undefined) {
                             // report based on naturalWidth
                             this.confirm(this.img.naturalWidth !== 0, 'naturalWidth');
                             return;
                         }

                         // If none of the checks above matched, simulate loading on detached element.
                         var proxyImage = this.proxyImage = new Image();
                         eventie.bind(proxyImage, 'load', this);
                         eventie.bind(proxyImage, 'error', this);
                         proxyImage.src = this.img.src;
                     };

                     LoadingImage.prototype.useCached = function (cached) {
                         if (cached.isConfirmed) {
                             this.confirm(cached.isLoaded, 'cached was confirmed');
                         } else {
                             var _this = this;
                             cached.on('confirm', function (image) {
                                 _this.confirm(image.isLoaded, 'cache emitted confirmed');
                                 return true; // bind once
                             });
                         }
                     };

                     LoadingImage.prototype.confirm = function (isLoaded, message) {
                         this.isConfirmed = true;
                         this.isLoaded = isLoaded;
                         this.emit('confirm', this, message);
                     };

                     // trigger specified handler for event type
                     LoadingImage.prototype.handleEvent = function (event) {
                         var method = 'on' + event.type;
                         if (this[method]) {
                             this[method](event);
                         }
                     };

                     LoadingImage.prototype.onload = function () {
                         this.confirm(true, 'onload');
                         this.unbindProxyEvents();
                     };

                     LoadingImage.prototype.onerror = function () {
                         this.confirm(false, 'onerror');
                         this.unbindProxyEvents();
                     };

                     LoadingImage.prototype.unbindProxyEvents = function () {
                         eventie.unbind(this.proxyImage, 'load', this);
                         eventie.unbind(this.proxyImage, 'error', this);
                     };

                     // -----  ----- //

                     return ImagesLoaded;
                 }

                 // -------------------------- transport -------------------------- //

                 if (typeof define === 'function' && define.amd) {
                     // AMD
                     define([
                         'eventEmitter/EventEmitter',
                         'eventie/eventie'
                     ],
                       defineImagesLoaded);
                 } else {
                     // browser global
                     window.imagesLoaded = defineImagesLoaded(
                       window.EventEmitter,
                       window.eventie
                     );
                 }

             })(window);

             /*!
              * skrollr core
              *
              * Alexander Prinzhorn - https://github.com/Prinzhorn/skrollr
              *
              * Free to use under terms of MIT license
              */
             (function (window, document, undefined) {
                 'use strict';

                 /*
                  * Global api.
                  */
                 var skrollr = window.skrollr = {
                     get: function () {
                         return _instance;
                     },
                     //Main entry point.
                     init: function (options) {
                         return _instance || new Skrollr(options);
                     },
                     VERSION: '0.6.17'
                 };

                 //Minify optimization.
                 var hasProp = Object.prototype.hasOwnProperty;
                 var Math = window.Math;
                 var getStyle = window.getComputedStyle;

                 //They will be filled when skrollr gets initialized.
                 var documentElement;
                 var body;

                 var EVENT_TOUCHSTART = 'touchstart';
                 var EVENT_TOUCHMOVE = 'touchmove';
                 var EVENT_TOUCHCANCEL = 'touchcancel';
                 var EVENT_TOUCHEND = 'touchend';

                 var SKROLLABLE_CLASS = 'skrollable';
                 var SKROLLABLE_BEFORE_CLASS = SKROLLABLE_CLASS + '-before';
                 var SKROLLABLE_BETWEEN_CLASS = SKROLLABLE_CLASS + '-between';
                 var SKROLLABLE_AFTER_CLASS = SKROLLABLE_CLASS + '-after';

                 var SKROLLR_CLASS = 'skrollr';
                 var NO_SKROLLR_CLASS = 'no-' + SKROLLR_CLASS;
                 var SKROLLR_DESKTOP_CLASS = SKROLLR_CLASS + '-desktop';
                 var SKROLLR_MOBILE_CLASS = SKROLLR_CLASS + '-mobile';

                 var DEFAULT_EASING = 'linear';
                 var DEFAULT_DURATION = 1000;//ms
                 var DEFAULT_MOBILE_DECELERATION = 0.004;//pixel/ms²

                 var DEFAULT_SMOOTH_SCROLLING_DURATION = 200;//ms

                 var ANCHOR_START = 'start';
                 var ANCHOR_END = 'end';
                 var ANCHOR_CENTER = 'center';
                 var ANCHOR_BOTTOM = 'bottom';

                 //The property which will be added to the DOM element to hold the ID of the skrollable.
                 var SKROLLABLE_ID_DOM_PROPERTY = '___skrollable_id';

                 var rxTouchIgnoreTags = /^(?:input|textarea|button|select)$/i;

                 var rxTrim = /^\s+|\s+$/g;

                 //Find all data-attributes. data-[_constant]-[offset]-[anchor]-[anchor].
                 var rxKeyframeAttribute = /^data(?:-(_\w+))?(?:-?(-?\d*\.?\d+p?))?(?:-?(start|end|top|center|bottom))?(?:-?(top|center|bottom))?$/;

                 var rxPropValue = /\s*([\w\-\[\]]+)\s*:\s*(.+?)\s*(?:;|$)/gi;

                 //Easing function names follow the property in square brackets.
                 var rxPropEasing = /^([a-z\-]+)\[(\w+)\]$/;

                 var rxCamelCase = /-([a-z])/g;
                 var rxCamelCaseFn = function (str, letter) {
                     return letter.toUpperCase();
                 };

                 //Numeric values with optional sign.
                 var rxNumericValue = /[\-+]?[\d]*\.?[\d]+/g;

                 //Used to replace occurences of {?} with a number.
                 var rxInterpolateString = /\{\?\}/g;

                 //Finds rgb(a) colors, which don't use the percentage notation.
                 var rxRGBAIntegerColor = /rgba?\(\s*-?\d+\s*,\s*-?\d+\s*,\s*-?\d+/g;

                 //Finds all gradients.
                 var rxGradient = /[a-z\-]+-gradient/g;

                 //Vendor prefix. Will be set once skrollr gets initialized.
                 var theCSSPrefix = '';
                 var theDashedCSSPrefix = '';

                 //Will be called once (when skrollr gets initialized).
                 var detectCSSPrefix = function () {
                     //Only relevant prefixes. May be extended.
                     //Could be dangerous if there will ever be a CSS property which actually starts with "ms". Don't hope so.
                     var rxPrefixes = /^(?:O|Moz|webkit|ms)|(?:-(?:o|moz|webkit|ms)-)/;

                     //Detect prefix for current browser by finding the first property using a prefix.
                     if (!getStyle) {
                         return;
                     }

                     var style = getStyle(body, null);

                     for (var k in style) {
                         //We check the key and if the key is a number, we check the value as well, because safari's getComputedStyle returns some weird array-like thingy.
                         theCSSPrefix = (k.match(rxPrefixes) || (+k == k && style[k].match(rxPrefixes)));

                         if (theCSSPrefix) {
                             break;
                         }
                     }

                     //Did we even detect a prefix?
                     if (!theCSSPrefix) {
                         theCSSPrefix = theDashedCSSPrefix = '';

                         return;
                     }

                     theCSSPrefix = theCSSPrefix[0];

                     //We could have detected either a dashed prefix or this camelCaseish-inconsistent stuff.
                     if (theCSSPrefix.slice(0, 1) === '-') {
                         theDashedCSSPrefix = theCSSPrefix;

                         //There's no logic behind these. Need a look up.
                         theCSSPrefix = ({
                             '-webkit-': 'webkit',
                             '-moz-': 'Moz',
                             '-ms-': 'ms',
                             '-o-': 'O'
                         })[theCSSPrefix];
                     } else {
                         theDashedCSSPrefix = '-' + theCSSPrefix.toLowerCase() + '-';
                     }
                 };

                 var polyfillRAF = function () {
                     var requestAnimFrame = window.requestAnimationFrame || window[theCSSPrefix.toLowerCase() + 'RequestAnimationFrame'];

                     var lastTime = _now();

                     if (_isMobile || !requestAnimFrame) {
                         requestAnimFrame = function (callback) {
                             //How long did it take to render?
                             var deltaTime = _now() - lastTime;
                             var delay = Math.max(0, 1000 / 60 - deltaTime);

                             return window.setTimeout(function () {
                                 lastTime = _now();
                                 callback();
                             }, delay);
                         };
                     }

                     return requestAnimFrame;
                 };

                 var polyfillCAF = function () {
                     var cancelAnimFrame = window.cancelAnimationFrame || window[theCSSPrefix.toLowerCase() + 'CancelAnimationFrame'];

                     if (_isMobile || !cancelAnimFrame) {
                         cancelAnimFrame = function (timeout) {
                             return window.clearTimeout(timeout);
                         };
                     }

                     return cancelAnimFrame;
                 };

                 //Built-in easing functions.
                 var easings = {
                     begin: function () {
                         return 0;
                     },
                     end: function () {
                         return 1;
                     },
                     linear: function (p) {
                         return p;
                     },
                     quadratic: function (p) {
                         return p * p;
                     },
                     cubic: function (p) {
                         return p * p * p;
                     },
                     swing: function (p) {
                         return (-Math.cos(p * Math.PI) / 2) + 0.5;
                     },
                     sqrt: function (p) {
                         return Math.sqrt(p);
                     },
                     outCubic: function (p) {
                         return (Math.pow((p - 1), 3) + 1);
                     },
                     //see https://www.desmos.com/calculator/tbr20s8vd2 for how I did this
                     bounce: function (p) {
                         var a;

                         if (p <= 0.5083) {
                             a = 3;
                         } else if (p <= 0.8489) {
                             a = 9;
                         } else if (p <= 0.96208) {
                             a = 27;
                         } else if (p <= 0.99981) {
                             a = 91;
                         } else {
                             return 1;
                         }

                         return 1 - Math.abs(3 * Math.cos(p * a * 1.028) / a);
                     }
                 };

                 /**
                  * Constructor.
                  */
                 function Skrollr(options) {
                     documentElement = document.documentElement;
                     body = document.body;

                     detectCSSPrefix();

                     _instance = this;

                     options = options || {};

                     _constants = options.constants || {};

                     //We allow defining custom easings or overwrite existing.
                     if (options.easing) {
                         for (var e in options.easing) {
                             easings[e] = options.easing[e];
                         }
                     }

                     _edgeStrategy = options.edgeStrategy || 'set';

                     _listeners = {
                         //Function to be called right before rendering.
                         beforerender: options.beforerender,

                         //Function to be called right after finishing rendering.
                         render: options.render
                     };

                     //forceHeight is true by default
                     _forceHeight = options.forceHeight !== false;

                     if (_forceHeight) {
                         _scale = options.scale || 1;
                     }

                     _mobileDeceleration = options.mobileDeceleration || DEFAULT_MOBILE_DECELERATION;

                     _smoothScrollingEnabled = options.smoothScrolling !== false;
                     _smoothScrollingDuration = options.smoothScrollingDuration || DEFAULT_SMOOTH_SCROLLING_DURATION;

                     //Dummy object. Will be overwritten in the _render method when smooth scrolling is calculated.
                     _smoothScrolling = {
                         targetTop: _instance.getScrollTop()
                     };

                     //A custom check function may be passed.
                     _isMobile = ((options.mobileCheck || function () {
                         return (/Android|iPhone|iPad|iPod|BlackBerry|Windows Phone/i).test(navigator.userAgent || navigator.vendor || window.opera);
                     })());

                     if (_isMobile) {
                         _skrollrBody = document.getElementById('skrollr-body');

                         //Detect 3d transform if there's a skrollr-body (only needed for #skrollr-body).
                         if (_skrollrBody) {
                             _detect3DTransforms();
                         }

                         _initMobile();
                         _updateClass(documentElement, [SKROLLR_CLASS, SKROLLR_MOBILE_CLASS], [NO_SKROLLR_CLASS]);
                     } else {
                         _updateClass(documentElement, [SKROLLR_CLASS, SKROLLR_DESKTOP_CLASS], [NO_SKROLLR_CLASS]);
                     }

                     //Triggers parsing of elements and a first reflow.
                     _instance.refresh();

                     _addEvent(window, 'resize orientationchange', function () {
                         var width = documentElement.clientWidth;
                         var height = documentElement.clientHeight;

                         //Only reflow if the size actually changed (#271).
                         if (height !== _lastViewportHeight || width !== _lastViewportWidth) {
                             _lastViewportHeight = height;
                             _lastViewportWidth = width;

                             _requestReflow = true;
                         }
                     });

                     var requestAnimFrame = polyfillRAF();

                     //Let's go.
                     (function animloop() {
                         _render();
                         _animFrame = requestAnimFrame(animloop);
                     }());

                     return _instance;
                 }

                 /**
                  * (Re)parses some or all elements.
                  */
                 Skrollr.prototype.refresh = function (elements) {
                     var elementIndex;
                     var elementsLength;
                     var ignoreID = false;

                     //Completely reparse anything without argument.
                     if (elements === undefined) {
                         //Ignore that some elements may already have a skrollable ID.
                         ignoreID = true;

                         _skrollables = [];
                         _skrollableIdCounter = 0;

                         elements = document.getElementsByTagName('*');
                     } else {
                         //We accept a single element or an array of elements.
                         elements = [].concat(elements);
                     }

                     elementIndex = 0;
                     elementsLength = elements.length;

                     for (; elementIndex < elementsLength; elementIndex++) {
                         var el = elements[elementIndex];
                         var anchorTarget = el;
                         var keyFrames = [];

                         //If this particular element should be smooth scrolled.
                         var smoothScrollThis = _smoothScrollingEnabled;

                         //The edge strategy for this particular element.
                         var edgeStrategy = _edgeStrategy;

                         if (!el.attributes) {
                             continue;
                         }

                         //Iterate over all attributes and search for key frame attributes.
                         var attributeIndex = 0;
                         var attributesLength = el.attributes.length;

                         for (; attributeIndex < attributesLength; attributeIndex++) {
                             var attr = el.attributes[attributeIndex];

                             if (attr.name === 'data-anchor-target') {
                                 anchorTarget = document.querySelector(attr.value);

                                 if (anchorTarget === null) {
                                     throw 'Unable to find anchor target "' + attr.value + '"';
                                 }

                                 continue;
                             }

                             //Global smooth scrolling can be overridden by the element attribute.
                             if (attr.name === 'data-smooth-scrolling') {
                                 smoothScrollThis = attr.value !== 'off';

                                 continue;
                             }

                             //Global edge strategy can be overridden by the element attribute.
                             if (attr.name === 'data-edge-strategy') {
                                 edgeStrategy = attr.value;

                                 continue;
                             }

                             var match = attr.name.match(rxKeyframeAttribute);

                             if (match === null) {
                                 continue;
                             }

                             var kf = {
                                 props: attr.value,
                                 //Point back to the element as well.
                                 element: el
                             };

                             keyFrames.push(kf);

                             var constant = match[1];

                             //If there is a constant, get it's value or fall back to 0.
                             constant = constant && _constants[constant.substr(1)] || 0;

                             //Parse key frame offset. If undefined will be casted to 0.
                             var offset = match[2];

                             //Is it a percentage offset?
                             if (/p$/.test(offset)) {
                                 kf.isPercentage = true;
                                 kf.offset = ((offset.slice(0, -1) | 0) + constant) / 100;
                             } else {
                                 kf.offset = (offset | 0) + constant;
                             }

                             var anchor1 = match[3];

                             //If second anchor is not set, the first will be taken for both.
                             var anchor2 = match[4] || anchor1;

                             //"absolute" (or "classic") mode, where numbers mean absolute scroll offset.
                             if (!anchor1 || anchor1 === ANCHOR_START || anchor1 === ANCHOR_END) {
                                 kf.mode = 'absolute';

                                 //data-end needs to be calculated after all key frames are known.
                                 if (anchor1 === ANCHOR_END) {
                                     kf.isEnd = true;
                                 } else if (!kf.isPercentage) {
                                     //For data-start we can already set the key frame w/o calculations.
                                     //#59: "scale" options should only affect absolute mode.
                                     kf.frame = kf.offset * _scale;

                                     delete kf.offset;
                                 }
                             }
                                 //"relative" mode, where numbers are relative to anchors.
                             else {
                                 kf.mode = 'relative';
                                 kf.anchors = [anchor1, anchor2];
                             }
                         }

                         //Does this element have key frames?
                         if (!keyFrames.length) {
                             continue;
                         }

                         //Will hold the original style and class attributes before we controlled the element (see #80).
                         var styleAttr, classAttr;

                         var id;

                         if (!ignoreID && SKROLLABLE_ID_DOM_PROPERTY in el) {
                             //We already have this element under control. Grab the corresponding skrollable id.
                             id = el[SKROLLABLE_ID_DOM_PROPERTY];
                             styleAttr = _skrollables[id].styleAttr;
                             classAttr = _skrollables[id].classAttr;
                         } else {
                             //It's an unknown element. Asign it a new skrollable id.
                             id = (el[SKROLLABLE_ID_DOM_PROPERTY] = _skrollableIdCounter++);
                             styleAttr = el.style.cssText;
                             classAttr = _getClass(el);
                         }

                         _skrollables[id] = {
                             element: el,
                             styleAttr: styleAttr,
                             classAttr: classAttr,
                             anchorTarget: anchorTarget,
                             keyFrames: keyFrames,
                             smoothScrolling: smoothScrollThis,
                             edgeStrategy: edgeStrategy
                         };

                         _updateClass(el, [SKROLLABLE_CLASS], []);
                     }

                     //Reflow for the first time.
                     _reflow();

                     //Now that we got all key frame numbers right, actually parse the properties.
                     elementIndex = 0;
                     elementsLength = elements.length;

                     for (; elementIndex < elementsLength; elementIndex++) {
                         var sk = _skrollables[elements[elementIndex][SKROLLABLE_ID_DOM_PROPERTY]];

                         if (sk === undefined) {
                             continue;
                         }

                         //Parse the property string to objects
                         _parseProps(sk);

                         //Fill key frames with missing properties from left and right
                         _fillProps(sk);
                     }

                     return _instance;
                 };

                 /**
                  * Transform "relative" mode to "absolute" mode.
                  * That is, calculate anchor position and offset of element.
                  */
                 Skrollr.prototype.relativeToAbsolute = function (element, viewportAnchor, elementAnchor) {
                     var viewportHeight = documentElement.clientHeight;
                     var box = element.getBoundingClientRect();
                     var absolute = box.top;

                     //#100: IE doesn't supply "height" with getBoundingClientRect.
                     var boxHeight = box.bottom - box.top;

                     if (viewportAnchor === ANCHOR_BOTTOM) {
                         absolute -= viewportHeight;
                     } else if (viewportAnchor === ANCHOR_CENTER) {
                         absolute -= viewportHeight / 2;
                     }

                     if (elementAnchor === ANCHOR_BOTTOM) {
                         absolute += boxHeight;
                     } else if (elementAnchor === ANCHOR_CENTER) {
                         absolute += boxHeight / 2;
                     }

                     //Compensate scrolling since getBoundingClientRect is relative to viewport.
                     absolute += _instance.getScrollTop();

                     return (absolute + 0.5) | 0;
                 };

                 /**
                  * Animates scroll top to new position.
                  */
                 Skrollr.prototype.animateTo = function (top, options) {
                     options = options || {};

                     var now = _now();
                     var scrollTop = _instance.getScrollTop();

                     //Setting this to a new value will automatically cause the current animation to stop, if any.
                     _scrollAnimation = {
                         startTop: scrollTop,
                         topDiff: top - scrollTop,
                         targetTop: top,
                         duration: options.duration || DEFAULT_DURATION,
                         startTime: now,
                         endTime: now + (options.duration || DEFAULT_DURATION),
                         easing: easings[options.easing || DEFAULT_EASING],
                         done: options.done
                     };

                     //Don't queue the animation if there's nothing to animate.
                     if (!_scrollAnimation.topDiff) {
                         if (_scrollAnimation.done) {
                             _scrollAnimation.done.call(_instance, false);
                         }

                         _scrollAnimation = undefined;
                     }

                     return _instance;
                 };

                 /**
                  * Stops animateTo animation.
                  */
                 Skrollr.prototype.stopAnimateTo = function () {
                     if (_scrollAnimation && _scrollAnimation.done) {
                         _scrollAnimation.done.call(_instance, true);
                     }

                     _scrollAnimation = undefined;
                 };

                 /**
                  * Returns if an animation caused by animateTo is currently running.
                  */
                 Skrollr.prototype.isAnimatingTo = function () {
                     return !!_scrollAnimation;
                 };

                 Skrollr.prototype.setScrollTop = function (top, force) {
                     _forceRender = (force === true);

                     if (_isMobile) {
                         _mobileOffset = Math.min(Math.max(top, 0), _maxKeyFrame);
                     } else {
                         window.scrollTo(0, top);
                     }

                     return _instance;
                 };

                 Skrollr.prototype.getScrollTop = function () {
                     if (_isMobile) {
                         return _mobileOffset;
                     } else {
                         return window.pageYOffset || documentElement.scrollTop || body.scrollTop || 0;
                     }
                 };

                 Skrollr.prototype.getMaxScrollTop = function () {

                     return _maxKeyFrame;
                 };

                 Skrollr.prototype.on = function (name, fn) {
                     _listeners[name] = fn;

                     return _instance;
                 };

                 Skrollr.prototype.off = function (name) {
                     delete _listeners[name];

                     return _instance;
                 };

                 Skrollr.prototype.destroy = function () {
                     var cancelAnimFrame = polyfillCAF();
                     cancelAnimFrame(_animFrame);
                     _removeAllEvents();

                     _updateClass(documentElement, [NO_SKROLLR_CLASS], [SKROLLR_CLASS, SKROLLR_DESKTOP_CLASS, SKROLLR_MOBILE_CLASS]);

                     var skrollableIndex = 0;
                     var skrollablesLength = _skrollables.length;

                     for (; skrollableIndex < skrollablesLength; skrollableIndex++) {
                         _reset(_skrollables[skrollableIndex].element);
                     }

                     documentElement.style.overflow = body.style.overflow = 'auto';
                     documentElement.style.height = body.style.height = 'auto';

                     if (_skrollrBody) {
                         skrollr.setStyle(_skrollrBody, 'transform', 'none');
                     }

                     _instance = undefined;
                     _skrollrBody = undefined;
                     _listeners = undefined;
                     _forceHeight = undefined;
                     _maxKeyFrame = 0;
                     _scale = 1;
                     _constants = undefined;
                     _mobileDeceleration = undefined;
                     _direction = 'down';
                     _lastTop = -1;
                     _lastViewportWidth = 0;
                     _lastViewportHeight = 0;
                     _requestReflow = false;
                     _scrollAnimation = undefined;
                     _smoothScrollingEnabled = undefined;
                     _smoothScrollingDuration = undefined;
                     _smoothScrolling = undefined;
                     _forceRender = undefined;
                     _skrollableIdCounter = 0;
                     _edgeStrategy = undefined;
                     _isMobile = false;
                     _mobileOffset = 0;
                     _translateZ = undefined;
                 };

                 /*
                     Private methods.
                 */

                 var _initMobile = function () {
                     var initialElement;
                     var initialTouchY;
                     var initialTouchX;
                     var currentElement;
                     var currentTouchY;
                     var currentTouchX;
                     var lastTouchY;
                     var deltaY;

                     var initialTouchTime;
                     var currentTouchTime;
                     var lastTouchTime;
                     var deltaTime;

                     _addEvent(documentElement, [EVENT_TOUCHSTART, EVENT_TOUCHMOVE, EVENT_TOUCHCANCEL, EVENT_TOUCHEND].join(' '), function (e) {
                         var touch = e.changedTouches[0];

                         currentElement = e.target;

                         //We don't want text nodes.
                         while (currentElement.nodeType === 3) {
                             currentElement = currentElement.parentNode;
                         }

                         currentTouchY = touch.clientY;
                         currentTouchX = touch.clientX;
                         currentTouchTime = e.timeStamp;

                         if (!rxTouchIgnoreTags.test(currentElement.tagName)) {
                             e.preventDefault();
                         }

                         switch (e.type) {
                             case EVENT_TOUCHSTART:
                                 //The last element we tapped on.
                                 if (initialElement) {
                                     initialElement.blur();
                                 }

                                 _instance.stopAnimateTo();

                                 initialElement = currentElement;

                                 initialTouchY = lastTouchY = currentTouchY;
                                 initialTouchX = currentTouchX;
                                 initialTouchTime = currentTouchTime;

                                 break;
                             case EVENT_TOUCHMOVE:
                                 deltaY = currentTouchY - lastTouchY;
                                 deltaTime = currentTouchTime - lastTouchTime;

                                 _instance.setScrollTop(_mobileOffset - deltaY, true);

                                 lastTouchY = currentTouchY;
                                 lastTouchTime = currentTouchTime;
                                 break;
                             default:
                             case EVENT_TOUCHCANCEL:
                             case EVENT_TOUCHEND:
                                 var distanceY = initialTouchY - currentTouchY;
                                 var distanceX = initialTouchX - currentTouchX;
                                 var distance2 = distanceX * distanceX + distanceY * distanceY;

                                 //Check if it was more like a tap (moved less than 7px).
                                 if (distance2 < 49) {
                                     if (!rxTouchIgnoreTags.test(initialElement.tagName)) {
                                         initialElement.focus();

                                         //It was a tap, click the element.
                                         var clickEvent = document.createEvent('MouseEvents');
                                         clickEvent.initMouseEvent('click', true, true, e.view, 1, touch.screenX, touch.screenY, touch.clientX, touch.clientY, e.ctrlKey, e.altKey, e.shiftKey, e.metaKey, 0, null);
                                         initialElement.dispatchEvent(clickEvent);
                                     }

                                     return;
                                 }

                                 initialElement = undefined;

                                 var speed = deltaY / deltaTime;

                                 //Cap speed at 3 pixel/ms.
                                 speed = Math.max(Math.min(speed, 3), -3);

                                 var duration = Math.abs(speed / _mobileDeceleration);
                                 var targetOffset = speed * duration + 0.5 * _mobileDeceleration * duration * duration;
                                 var targetTop = _instance.getScrollTop() - targetOffset;

                                 //Relative duration change for when scrolling above bounds.
                                 var targetRatio = 0;

                                 //Change duration proportionally when scrolling would leave bounds.
                                 if (targetTop > _maxKeyFrame) {
                                     targetRatio = (_maxKeyFrame - targetTop) / targetOffset;

                                     targetTop = _maxKeyFrame;
                                 } else if (targetTop < 0) {
                                     targetRatio = -targetTop / targetOffset;

                                     targetTop = 0;
                                 }

                                 duration = duration * (1 - targetRatio);

                                 _instance.animateTo((targetTop + 0.5) | 0, { easing: 'outCubic', duration: duration });
                                 break;
                         }
                     });

                     //Just in case there has already been some native scrolling, reset it.
                     window.scrollTo(0, 0);
                     documentElement.style.overflow = body.style.overflow = 'hidden';
                 };

                 /**
                  * Updates key frames which depend on others.
                  * That is "end" in "absolute" mode and all key frames in "relative" mode.
                  */
                 var _updateDependentKeyFrames = function () {
                     var skrollable;
                     var element;
                     var anchorTarget;
                     var keyFrames;
                     var keyFrameIndex;
                     var keyFramesLength;
                     var kf;
                     var skrollableIndex;
                     var skrollablesLength;

                     //First process all relative-mode elements and find the max key frame.
                     skrollableIndex = 0;
                     skrollablesLength = _skrollables.length;

                     for (; skrollableIndex < skrollablesLength; skrollableIndex++) {
                         skrollable = _skrollables[skrollableIndex];
                         element = skrollable.element;
                         anchorTarget = skrollable.anchorTarget;
                         keyFrames = skrollable.keyFrames;

                         keyFrameIndex = 0;
                         keyFramesLength = keyFrames.length;

                         for (; keyFrameIndex < keyFramesLength; keyFrameIndex++) {
                             kf = keyFrames[keyFrameIndex];

                             var offset = kf.offset;

                             if (kf.isPercentage) {
                                 //Convert the offset to percentage of the viewport height.
                                 offset = offset * documentElement.clientHeight;

                                 //Absolute + percentage mode.
                                 kf.frame = offset;
                             }

                             if (kf.mode === 'relative') {
                                 _reset(element);

                                 kf.frame = _instance.relativeToAbsolute(anchorTarget, kf.anchors[0], kf.anchors[1]) - offset;

                                 _reset(element, true);
                             }

                             //Only search for max key frame when forceHeight is enabled.
                             if (_forceHeight) {
                                 //Find the max key frame, but don't use one of the data-end ones for comparison.
                                 if (!kf.isEnd && kf.frame > _maxKeyFrame) {
                                     _maxKeyFrame = kf.frame;
                                 }
                             }
                         }
                     }

                     //#133: The document can be larger than the maxKeyFrame we found.
                     _maxKeyFrame = Math.max(_maxKeyFrame, _getDocumentHeight());

                     //Now process all data-end keyframes.
                     skrollableIndex = 0;
                     skrollablesLength = _skrollables.length;

                     for (; skrollableIndex < skrollablesLength; skrollableIndex++) {
                         skrollable = _skrollables[skrollableIndex];
                         keyFrames = skrollable.keyFrames;

                         keyFrameIndex = 0;
                         keyFramesLength = keyFrames.length;

                         for (; keyFrameIndex < keyFramesLength; keyFrameIndex++) {
                             kf = keyFrames[keyFrameIndex];

                             if (kf.isEnd) {
                                 kf.frame = _maxKeyFrame - kf.offset;
                             }
                         }

                         skrollable.keyFrames.sort(_keyFrameComparator);
                     }
                 };

                 /**
                  * Calculates and sets the style properties for the element at the given frame.
                  * @param fakeFrame The frame to render at when smooth scrolling is enabled.
                  * @param actualFrame The actual frame we are at.
                  */
                 var _calcSteps = function (fakeFrame, actualFrame) {
                     //Iterate over all skrollables.
                     var skrollableIndex = 0;
                     var skrollablesLength = _skrollables.length;

                     for (; skrollableIndex < skrollablesLength; skrollableIndex++) {
                         var skrollable = _skrollables[skrollableIndex];
                         var element = skrollable.element;
                         var frame = skrollable.smoothScrolling ? fakeFrame : actualFrame;
                         var frames = skrollable.keyFrames;
                         var firstFrame = frames[0].frame;
                         var lastFrame = frames[frames.length - 1].frame;
                         var beforeFirst = frame < firstFrame;
                         var afterLast = frame > lastFrame;
                         var firstOrLastFrame = frames[beforeFirst ? 0 : frames.length - 1];
                         var key;
                         var value;

                         //If we are before/after the first/last frame, set the styles according to the given edge strategy.
                         if (beforeFirst || afterLast) {
                             //Check if we already handled this edge case last time.
                             //Note: using setScrollTop it's possible that we jumped from one edge to the other.
                             if (beforeFirst && skrollable.edge === -1 || afterLast && skrollable.edge === 1) {
                                 continue;
                             }

                             //Add the skrollr-before or -after class.
                             _updateClass(element, [beforeFirst ? SKROLLABLE_BEFORE_CLASS : SKROLLABLE_AFTER_CLASS], [SKROLLABLE_BEFORE_CLASS, SKROLLABLE_BETWEEN_CLASS, SKROLLABLE_AFTER_CLASS]);

                             //Remember that we handled the edge case (before/after the first/last keyframe).
                             skrollable.edge = beforeFirst ? -1 : 1;

                             switch (skrollable.edgeStrategy) {
                                 case 'reset':
                                     _reset(element);
                                     continue;
                                 case 'ease':
                                     //Handle this case like it would be exactly at first/last keyframe and just pass it on.
                                     frame = firstOrLastFrame.frame;
                                     break;
                                 default:
                                 case 'set':
                                     var props = firstOrLastFrame.props;

                                     for (key in props) {
                                         if (hasProp.call(props, key)) {
                                             value = _interpolateString(props[key].value);

                                             skrollr.setStyle(element, key, value);
                                         }
                                     }

                                     continue;
                             }
                         } else {
                             //Did we handle an edge last time?
                             if (skrollable.edge !== 0) {
                                 _updateClass(element, [SKROLLABLE_CLASS, SKROLLABLE_BETWEEN_CLASS], [SKROLLABLE_BEFORE_CLASS, SKROLLABLE_AFTER_CLASS]);
                                 skrollable.edge = 0;
                             }
                         }

                         //Find out between which two key frames we are right now.
                         var keyFrameIndex = 0;
                         var framesLength = frames.length - 1;

                         for (; keyFrameIndex < framesLength; keyFrameIndex++) {
                             if (frame >= frames[keyFrameIndex].frame && frame <= frames[keyFrameIndex + 1].frame) {
                                 var left = frames[keyFrameIndex];
                                 var right = frames[keyFrameIndex + 1];

                                 for (key in left.props) {
                                     if (hasProp.call(left.props, key)) {
                                         var progress = (frame - left.frame) / (right.frame - left.frame);

                                         //Transform the current progress using the given easing function.
                                         progress = left.props[key].easing(progress);

                                         //Interpolate between the two values
                                         value = _calcInterpolation(left.props[key].value, right.props[key].value, progress);

                                         value = _interpolateString(value);

                                         skrollr.setStyle(element, key, value);
                                     }
                                 }

                                 break;
                             }
                         }
                     }
                 };

                 /**
                  * Renders all elements.
                  */
                 var _render = function () {
                     if (_requestReflow) {
                         _requestReflow = false;
                         _reflow();
                     }

                     //We may render something else than the actual scrollbar position.
                     var renderTop = _instance.getScrollTop();

                     //If there's an animation, which ends in current render call, call the callback after rendering.
                     var afterAnimationCallback;
                     var now = _now();
                     var progress;

                     //Before actually rendering handle the scroll animation, if any.
                     if (_scrollAnimation) {
                         //It's over
                         if (now >= _scrollAnimation.endTime) {
                             renderTop = _scrollAnimation.targetTop;
                             afterAnimationCallback = _scrollAnimation.done;
                             _scrollAnimation = undefined;
                         } else {
                             //Map the current progress to the new progress using given easing function.
                             progress = _scrollAnimation.easing((now - _scrollAnimation.startTime) / _scrollAnimation.duration);

                             renderTop = (_scrollAnimation.startTop + progress * _scrollAnimation.topDiff) | 0;
                         }

                         _instance.setScrollTop(renderTop, true);
                     }
                         //Smooth scrolling only if there's no animation running and if we're not forcing the rendering.
                     else if (!_forceRender) {
                         var smoothScrollingDiff = _smoothScrolling.targetTop - renderTop;

                         //The user scrolled, start new smooth scrolling.
                         if (smoothScrollingDiff) {
                             _smoothScrolling = {
                                 startTop: _lastTop,
                                 topDiff: renderTop - _lastTop,
                                 targetTop: renderTop,
                                 startTime: _lastRenderCall,
                                 endTime: _lastRenderCall + _smoothScrollingDuration
                             };
                         }

                         //Interpolate the internal scroll position (not the actual scrollbar).
                         if (now <= _smoothScrolling.endTime) {
                             //Map the current progress to the new progress using easing function.
                             progress = easings.sqrt((now - _smoothScrolling.startTime) / _smoothScrollingDuration);

                             renderTop = (_smoothScrolling.startTop + progress * _smoothScrolling.topDiff) | 0;
                         }
                     }

                     //That's were we actually "scroll" on mobile.
                     if (_isMobile && _skrollrBody) {
                         //Set the transform ("scroll it").
                         skrollr.setStyle(_skrollrBody, 'transform', 'translate(0, ' + -(_mobileOffset) + 'px) ' + _translateZ);
                     }

                     //Did the scroll position even change?
                     if (_forceRender || _lastTop !== renderTop) {
                         //Remember in which direction are we scrolling?
                         _direction = (renderTop > _lastTop) ? 'down' : (renderTop < _lastTop ? 'up' : _direction);

                         _forceRender = false;

                         var listenerParams = {
                             curTop: renderTop,
                             lastTop: _lastTop,
                             maxTop: _maxKeyFrame,
                             direction: _direction
                         };

                         //Tell the listener we are about to render.
                         var continueRendering = _listeners.beforerender && _listeners.beforerender.call(_instance, listenerParams);

                         //The beforerender listener function is able the cancel rendering.
                         if (continueRendering !== false) {
                             //Now actually interpolate all the styles.
                             _calcSteps(renderTop, _instance.getScrollTop());

                             //Remember when we last rendered.
                             _lastTop = renderTop;

                             if (_listeners.render) {
                                 _listeners.render.call(_instance, listenerParams);
                             }
                         }

                         if (afterAnimationCallback) {
                             afterAnimationCallback.call(_instance, false);
                         }
                     }

                     _lastRenderCall = now;
                 };

                 /**
                  * Parses the properties for each key frame of the given skrollable.
                  */
                 var _parseProps = function (skrollable) {
                     //Iterate over all key frames
                     var keyFrameIndex = 0;
                     var keyFramesLength = skrollable.keyFrames.length;

                     for (; keyFrameIndex < keyFramesLength; keyFrameIndex++) {
                         var frame = skrollable.keyFrames[keyFrameIndex];
                         var easing;
                         var value;
                         var prop;
                         var props = {};

                         var match;

                         while ((match = rxPropValue.exec(frame.props)) !== null) {
                             prop = match[1];
                             value = match[2];

                             easing = prop.match(rxPropEasing);

                             //Is there an easing specified for this prop?
                             if (easing !== null) {
                                 prop = easing[1];
                                 easing = easing[2];
                             } else {
                                 easing = DEFAULT_EASING;
                             }

                             //Exclamation point at first position forces the value to be taken literal.
                             value = value.indexOf('!') ? _parseProp(value) : [value.slice(1)];

                             //Save the prop for this key frame with his value and easing function
                             props[prop] = {
                                 value: value,
                                 easing: easings[easing]
                             };
                         }

                         frame.props = props;
                     }
                 };

                 /**
                  * Parses a value extracting numeric values and generating a format string
                  * for later interpolation of the new values in old string.
                  *
                  * @param val The CSS value to be parsed.
                  * @return Something like ["rgba(?%,?%, ?%,?)", 100, 50, 0, .7]
                  * where the first element is the format string later used
                  * and all following elements are the numeric value.
                  */
                 var _parseProp = function (val) {
                     var numbers = [];

                     //One special case, where floats don't work.
                     //We replace all occurences of rgba colors
                     //which don't use percentage notation with the percentage notation.
                     rxRGBAIntegerColor.lastIndex = 0;
                     val = val.replace(rxRGBAIntegerColor, function (rgba) {
                         return rgba.replace(rxNumericValue, function (n) {
                             return n / 255 * 100 + '%';
                         });
                     });

                     //Handle prefixing of "gradient" values.
                     //For now only the prefixed value will be set. Unprefixed isn't supported anyway.
                     if (theDashedCSSPrefix) {
                         rxGradient.lastIndex = 0;
                         val = val.replace(rxGradient, function (s) {
                             return theDashedCSSPrefix + s;
                         });
                     }

                     //Now parse ANY number inside this string and create a format string.
                     val = val.replace(rxNumericValue, function (n) {
                         numbers.push(+n);
                         return '{?}';
                     });

                     //Add the formatstring as first value.
                     numbers.unshift(val);

                     return numbers;
                 };

                 /**
                  * Fills the key frames with missing left and right hand properties.
                  * If key frame 1 has property X and key frame 2 is missing X,
                  * but key frame 3 has X again, then we need to assign X to key frame 2 too.
                  *
                  * @param sk A skrollable.
                  */
                 var _fillProps = function (sk) {
                     //Will collect the properties key frame by key frame
                     var propList = {};
                     var keyFrameIndex;
                     var keyFramesLength;

                     //Iterate over all key frames from left to right
                     keyFrameIndex = 0;
                     keyFramesLength = sk.keyFrames.length;

                     for (; keyFrameIndex < keyFramesLength; keyFrameIndex++) {
                         _fillPropForFrame(sk.keyFrames[keyFrameIndex], propList);
                     }

                     //Now do the same from right to fill the last gaps

                     propList = {};

                     //Iterate over all key frames from right to left
                     keyFrameIndex = sk.keyFrames.length - 1;

                     for (; keyFrameIndex >= 0; keyFrameIndex--) {
                         _fillPropForFrame(sk.keyFrames[keyFrameIndex], propList);
                     }
                 };

                 var _fillPropForFrame = function (frame, propList) {
                     var key;

                     //For each key frame iterate over all right hand properties and assign them,
                     //but only if the current key frame doesn't have the property by itself
                     for (key in propList) {
                         //The current frame misses this property, so assign it.
                         if (!hasProp.call(frame.props, key)) {
                             frame.props[key] = propList[key];
                         }
                     }

                     //Iterate over all props of the current frame and collect them
                     for (key in frame.props) {
                         propList[key] = frame.props[key];
                     }
                 };

                 /**
                  * Calculates the new values for two given values array.
                  */
                 var _calcInterpolation = function (val1, val2, progress) {
                     var valueIndex;
                     var val1Length = val1.length;

                     //They both need to have the same length
                     if (val1Length !== val2.length) {
                         throw 'Can\'t interpolate between "' + val1[0] + '" and "' + val2[0] + '"';
                     }

                     //Add the format string as first element.
                     var interpolated = [val1[0]];

                     valueIndex = 1;

                     for (; valueIndex < val1Length; valueIndex++) {
                         //That's the line where the two numbers are actually interpolated.
                         interpolated[valueIndex] = val1[valueIndex] + ((val2[valueIndex] - val1[valueIndex]) * progress);
                     }

                     return interpolated;
                 };

                 /**
                  * Interpolates the numeric values into the format string.
                  */
                 var _interpolateString = function (val) {
                     var valueIndex = 1;

                     rxInterpolateString.lastIndex = 0;

                     return val[0].replace(rxInterpolateString, function () {
                         return val[valueIndex++];
                     });
                 };

                 /**
                  * Resets the class and style attribute to what it was before skrollr manipulated the element.
                  * Also remembers the values it had before reseting, in order to undo the reset.
                  */
                 var _reset = function (elements, undo) {
                     //We accept a single element or an array of elements.
                     elements = [].concat(elements);

                     var skrollable;
                     var element;
                     var elementsIndex = 0;
                     var elementsLength = elements.length;

                     for (; elementsIndex < elementsLength; elementsIndex++) {
                         element = elements[elementsIndex];
                         skrollable = _skrollables[element[SKROLLABLE_ID_DOM_PROPERTY]];

                         //Couldn't find the skrollable for this DOM element.
                         if (!skrollable) {
                             continue;
                         }

                         if (undo) {
                             //Reset class and style to the "dirty" (set by skrollr) values.
                             element.style.cssText = skrollable.dirtyStyleAttr;
                             _updateClass(element, skrollable.dirtyClassAttr);
                         } else {
                             //Remember the "dirty" (set by skrollr) class and style.
                             skrollable.dirtyStyleAttr = element.style.cssText;
                             skrollable.dirtyClassAttr = _getClass(element);

                             //Reset class and style to what it originally was.
                             element.style.cssText = skrollable.styleAttr;
                             _updateClass(element, skrollable.classAttr);
                         }
                     }
                 };

                 /**
                  * Detects support for 3d transforms by applying it to the skrollr-body.
                  */
                 var _detect3DTransforms = function () {
                     _translateZ = 'translateZ(0)';
                     skrollr.setStyle(_skrollrBody, 'transform', _translateZ);

                     var computedStyle = getStyle(_skrollrBody);
                     var computedTransform = computedStyle.getPropertyValue('transform');
                     var computedTransformWithPrefix = computedStyle.getPropertyValue(theDashedCSSPrefix + 'transform');
                     var has3D = (computedTransform && computedTransform !== 'none') || (computedTransformWithPrefix && computedTransformWithPrefix !== 'none');

                     if (!has3D) {
                         _translateZ = '';
                     }
                 };

                 /**
                  * Set the CSS property on the given element. Sets prefixed properties as well.
                  */
                 skrollr.setStyle = function (el, prop, val) {
                     var style = el.style;

                     //Camel case.
                     prop = prop.replace(rxCamelCase, rxCamelCaseFn).replace('-', '');

                     //Make sure z-index gets a <integer>.
                     //This is the only <integer> case we need to handle.
                     if (prop === 'zIndex') {
                         if (isNaN(val)) {
                             //If it's not a number, don't touch it.
                             //It could for example be "auto" (#351).
                             style[prop] = val;
                         } else {
                             //Floor the number.
                             style[prop] = '' + (val | 0);
                         }
                     }
                         //#64: "float" can't be set across browsers. Needs to use "cssFloat" for all except IE.
                     else if (prop === 'float') {
                         style.styleFloat = style.cssFloat = val;
                     }
                     else {
                         //Need try-catch for old IE.
                         try {
                             //Set prefixed property if there's a prefix.
                             if (theCSSPrefix) {
                                 style[theCSSPrefix + prop.slice(0, 1).toUpperCase() + prop.slice(1)] = val;
                             }

                             //Set unprefixed.
                             style[prop] = val;
                         } catch (ignore) { }
                     }
                 };

                 /**
                  * Cross browser event handling.
                  */
                 var _addEvent = skrollr.addEvent = function (element, names, callback) {
                     var intermediate = function (e) {
                         //Normalize IE event stuff.
                         e = e || window.event;

                         if (!e.target) {
                             e.target = e.srcElement;
                         }

                         if (!e.preventDefault) {
                             e.preventDefault = function () {
                                 e.returnValue = false;
                             };
                         }

                         return callback.call(this, e);
                     };

                     names = names.split(' ');

                     var name;
                     var nameCounter = 0;
                     var namesLength = names.length;

                     for (; nameCounter < namesLength; nameCounter++) {
                         name = names[nameCounter];

                         if (element.addEventListener) {
                             element.addEventListener(name, callback, false);
                         } else {
                             element.attachEvent('on' + name, intermediate);
                         }

                         //Remember the events to be able to flush them later.
                         _registeredEvents.push({
                             element: element,
                             name: name,
                             listener: callback
                         });
                     }
                 };

                 var _removeEvent = skrollr.removeEvent = function (element, names, callback) {
                     names = names.split(' ');

                     var nameCounter = 0;
                     var namesLength = names.length;

                     for (; nameCounter < namesLength; nameCounter++) {
                         if (element.removeEventListener) {
                             element.removeEventListener(names[nameCounter], callback, false);
                         } else {
                             element.detachEvent('on' + names[nameCounter], callback);
                         }
                     }
                 };

                 var _removeAllEvents = function () {
                     var eventData;
                     var eventCounter = 0;
                     var eventsLength = _registeredEvents.length;

                     for (; eventCounter < eventsLength; eventCounter++) {
                         eventData = _registeredEvents[eventCounter];

                         _removeEvent(eventData.element, eventData.name, eventData.listener);
                     }

                     _registeredEvents = [];
                 };

                 var _reflow = function () {
                     var pos = _instance.getScrollTop();

                     //Will be recalculated by _updateDependentKeyFrames.
                     _maxKeyFrame = 0;

                     if (_forceHeight && !_isMobile) {
                         //un-"force" the height to not mess with the calculations in _updateDependentKeyFrames (#216).
                         body.style.height = 'auto';
                     }

                     _updateDependentKeyFrames();

                     if (_forceHeight && !_isMobile) {
                         //"force" the height.
                         body.style.height = (_maxKeyFrame + documentElement.clientHeight) + 'px';
                     }

                     //The scroll offset may now be larger than needed (on desktop the browser/os prevents scrolling farther than the bottom).
                     if (_isMobile) {
                         _instance.setScrollTop(Math.min(_instance.getScrollTop(), _maxKeyFrame));
                     } else {
                         //Remember and reset the scroll pos (#217).
                         _instance.setScrollTop(pos, true);
                     }

                     _forceRender = true;
                 };

                 /*
                  * Returns the height of the document.
                  */
                 var _getDocumentHeight = function () {
                     var skrollrBodyHeight = (_skrollrBody && _skrollrBody.offsetHeight || 0);
                     var bodyHeight = Math.max(skrollrBodyHeight, body.scrollHeight, body.offsetHeight, documentElement.scrollHeight, documentElement.offsetHeight, documentElement.clientHeight);

                     return bodyHeight - documentElement.clientHeight;
                 };

                 /**
                  * Returns a string of space separated classnames for the current element.
                  * Works with SVG as well.
                  */
                 var _getClass = function (element) {
                     var prop = 'className';

                     //SVG support by using className.baseVal instead of just className.
                     if (window.SVGElement && element instanceof window.SVGElement) {
                         element = element[prop];
                         prop = 'baseVal';
                     }

                     return element[prop];
                 };

                 /**
                  * Adds and removes a CSS classes.
                  * Works with SVG as well.
                  * add and remove are arrays of strings,
                  * or if remove is ommited add is a string and overwrites all classes.
                  */
                 var _updateClass = function (element, add, remove) {
                     var prop = 'className';

                     //SVG support by using className.baseVal instead of just className.
                     if (window.SVGElement && element instanceof window.SVGElement) {
                         element = element[prop];
                         prop = 'baseVal';
                     }

                     //When remove is ommited, we want to overwrite/set the classes.
                     if (remove === undefined) {
                         element[prop] = add;
                         return;
                     }

                     //Cache current classes. We will work on a string before passing back to DOM.
                     var val = element[prop];

                     //All classes to be removed.
                     var classRemoveIndex = 0;
                     var removeLength = remove.length;

                     for (; classRemoveIndex < removeLength; classRemoveIndex++) {
                         val = _untrim(val).replace(_untrim(remove[classRemoveIndex]), ' ');
                     }

                     val = _trim(val);

                     //All classes to be added.
                     var classAddIndex = 0;
                     var addLength = add.length;

                     for (; classAddIndex < addLength; classAddIndex++) {
                         //Only add if el not already has class.
                         if (_untrim(val).indexOf(_untrim(add[classAddIndex])) === -1) {
                             val += ' ' + add[classAddIndex];
                         }
                     }

                     element[prop] = _trim(val);
                 };

                 var _trim = function (a) {
                     return a.replace(rxTrim, '');
                 };

                 /**
                  * Adds a space before and after the string.
                  */
                 var _untrim = function (a) {
                     return ' ' + a + ' ';
                 };

                 var _now = Date.now || function () {
                     return +new Date();
                 };

                 var _keyFrameComparator = function (a, b) {
                     return a.frame - b.frame;
                 };

                 /*
                  * Private variables.
                  */

                 //Singleton
                 var _instance;

                 /*
                     A list of all elements which should be animated associated with their the metadata.
                     Exmaple skrollable with two key frames animating from 100px width to 20px:
             
                     skrollable = {
                         element: <the DOM element>,
                         styleAttr: <style attribute of the element before skrollr>,
                         classAttr: <class attribute of the element before skrollr>,
                         keyFrames: [
                             {
                                 frame: 100,
                                 props: {
                                     width: {
                                         value: ['{?}px', 100],
                                         easing: <reference to easing function>
                                     }
                                 },
                                 mode: "absolute"
                             },
                             {
                                 frame: 200,
                                 props: {
                                     width: {
                                         value: ['{?}px', 20],
                                         easing: <reference to easing function>
                                     }
                                 },
                                 mode: "absolute"
                             }
                         ]
                     };
                 */
                 var _skrollables;

                 var _skrollrBody;

                 var _listeners;
                 var _forceHeight;
                 var _maxKeyFrame = 0;

                 var _scale = 1;
                 var _constants;

                 var _mobileDeceleration;

                 //Current direction (up/down).
                 var _direction = 'down';

                 //The last top offset value. Needed to determine direction.
                 var _lastTop = -1;

                 //The last time we called the render method (doesn't mean we rendered!).
                 var _lastRenderCall = _now();

                 //For detecting if it actually resized (#271).
                 var _lastViewportWidth = 0;
                 var _lastViewportHeight = 0;

                 var _requestReflow = false;

                 //Will contain data about a running scrollbar animation, if any.
                 var _scrollAnimation;

                 var _smoothScrollingEnabled;

                 var _smoothScrollingDuration;

                 //Will contain settins for smooth scrolling if enabled.
                 var _smoothScrolling;

                 //Can be set by any operation/event to force rendering even if the scrollbar didn't move.
                 var _forceRender;

                 //Each skrollable gets an unique ID incremented for each skrollable.
                 //The ID is the index in the _skrollables array.
                 var _skrollableIdCounter = 0;

                 var _edgeStrategy;


                 //Mobile specific vars. Will be stripped by UglifyJS when not in use.
                 var _isMobile = false;

                 //The virtual scroll offset when using mobile scrolling.
                 var _mobileOffset = 0;

                 //If the browser supports 3d transforms, this will be filled with 'translateZ(0)' (empty string otherwise).
                 var _translateZ;

                 //Will contain data about registered events by skrollr.
                 var _registeredEvents = [];

                 //Animation frame id returned by RequestAnimationFrame (or timeout when RAF is not supported).
                 var _animFrame;
             }(window, document));

             /*! viewportSize | Author: Tyson Matanich, 2013 | License: MIT */
             (function (n) { n.viewportSize = {}, n.viewportSize.getHeight = function () { return t("Height") }, n.viewportSize.getWidth = function () { return t("Width") }; var t = function (t) { var f, o = t.toLowerCase(), e = n.document, i = e.documentElement, r, u; return n["inner" + t] === undefined ? f = i["client" + t] : n["inner" + t] != i["client" + t] ? (r = e.createElement("body"), r.id = "vpw-test-b", r.style.cssText = "overflow:scroll", u = e.createElement("div"), u.id = "vpw-test-d", u.style.cssText = "position:absolute;top:-1000px", u.innerHTML = "<style>@media(" + o + ":" + i["client" + t] + "px){body#vpw-test-b div#vpw-test-d{" + o + ":7px!important}}<\/style>", r.appendChild(u), i.insertBefore(r, e.head), f = u["offset" + t] == 7 ? i["client" + t] : n["inner" + t], i.removeChild(r)) : f = n["inner" + t], f } })(this);

             /**
              * How to create a parallax scrolling website
              * Author: Petr Tichy
              * URL: www.ihatetomatoes.net
              * Article URL: http://ihatetomatoes.net/how-to-create-a-parallax-scrolling-website/
              */

             (function ($) {

                 // Setup variables
                 $window = $(window);
                 $slide = $('.homeSlide');
                 $slideTall = $('.homeSlideTall');
                 $slideTall2 = $('.homeSlideTall2');
                 $body = $('body');

                 //FadeIn all sections   
                 $body.imagesLoaded(function () {
                     setTimeout(function () {

                         // Resize sections
                         adjustWindow();

                         // Fade in sections
                         $body.removeClass('loading').addClass('loaded');

                     }, 800);
                 });

                 function adjustWindow() {

                     // Init Skrollr
                     var s = skrollr.init({
                         render: function (data) {

                             //Debugging - Log the current scroll position.
                             //console.log(data.curTop);
                         }
                     });

                     // Get window size
                     winH = $window.height();

                     // Keep minimum height 550
                     if (winH <= 550) {
                         winH = 550;
                     }

                     // Resize our slides
                     $slide.height(winH);
                     $slideTall.height(winH * 2);
                     $slideTall2.height(winH * 3);

                     // Refresh Skrollr after resizing our sections
                     s.refresh($('.homeSlide'));

                 }

             })(jQuery);

         }

		</script>
     
<!----------------------------skrollr js--> 
</asp:Content>

