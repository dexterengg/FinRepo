angular.module('myApp', ['ui.router', 'ui.bootstrap', 'ngAnimate', 'ngSanitize', 'toggle-switch', 'rzModule'])
    .config(function ($stateProvider, $urlRouterProvider) {
        //
        // For any unmatched url, redirect to /state1
        $urlRouterProvider.otherwise("/Start");
        //
        // Now set up the states
        $stateProvider
      .state('Start', {
          url: "/Start",
          views: {
              "viewA": {
                  templateUrl: "Age/Age.html",
                  controller: "AgeController"
              }
          }

      })
                .state('familystatus', {
                    url: "/Start",
                    views: {
                        "viewA": {
                            templateUrl: "familystatus/familystatus.html",
                            controller: "familystatusController"
                        }
                    }

                })
              .state('Annualincome', {
                  url: "/Start",
                  views: {
                      "viewA": {
                          templateUrl: "Annualincome/Annualincome.html",
                          controller: "AnnualincomeController"
                      }
                  }

              })
        .state('Monthlyexpense', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Monthlyexpense/Monthlyexpense.html",
                    controller: "MonthlyexpenseController"
                }
            }

        })
        .state('City', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "City/City.html",
                    controller: "CityController"
                }
            }

        })
        .state('hospitals', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "hospitals/hospitals.html",
                    controller: "hospitalsController"
                }
            }

        })
        .state('illness', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "illness/illness.html",
                    controller: "illnessController"
                }
            }

        })
        .state('Inflation', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Inflation/Inflation.html",
                    controller: "InflationController"
                }
            }

        })
        .state('3goals', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "3goals/3goals.html",
                    controller: "3goalsController"
                }
            }

        })
                        .state('noofchildren', {
                            url: "/Start",
                            views: {
                                "viewA": {
                                    templateUrl: "noofchildren/noofchildren.html",
                                    controller: "noofchildrenController"
                                }
                            }

                        })
        .state('childrenage', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "childrenage/childrenage.html",
                    controller: "childrenageController"
                }
            }

        })
                .state('childreneducationcost', {
                    url: "/Start",
                    views: {
                        "viewA": {
                            templateUrl: "childreneducationcost/childreneducationcost.html",
                            controller: "childreneducationcostController"
                        }
                    }

                })
        .state('childrenmarriagecost', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "childrenmarriagecost/childrenmarriagecost.html",
                    controller: "childrenmarriagecostController"
                }
            }

        })
        .state('Assetcost', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Assetcost/Assetcost.html",
                    controller: "AssetcostController"
                }
            }

        })
            .state('Assettime', {
                url: "/Start",
                views: {
                    "viewA": {
                        templateUrl: "Assettime/Assettime.html",
                        controller: "AssettimeController"
                    }
                }

            })
        .state('Vacationcost', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Vacationcost/Vacationcost.html",
                    controller: "VacationcostController"
                }
            }

        })
        .state('Vacationtime', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Vacationtime/Vacationtime.html",
                    controller: "VacationtimeController"
                }
            }

        })
        .state('Retirementage', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Retirementage/Retirementage.html",
                    controller: "RetirementageController"
                }
            }

        })
         .state('Lifeexpectancy', {
             url: "/Start",
             views: {
                 "viewA": {
                     templateUrl: "Lifeexpectancy/Lifeexpectancy.html",
                     controller: "LifeexpectancyController"
                 }
             }

         })
        .state('Othercost', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Othercost/Othercost.html",
                    controller: "OthercostController"
                }
            }

        })
        .state('Othertime', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Othertime/Othertime.html",
                    controller: "OthertimeController"
                }
            }

        })
        .state('Investingcare', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Investingcare/Investingcare.html",
                    controller: "InvestingcareController"
                }
            }

        })
        .state('Stockmarketdecline', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Stockmarketdecline/Stockmarketdecline.html",
                    controller: "StockmarketdeclineController"
                }
            }

        })
        .state('Knowledgerate', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Knowledgerate/Knowledgerate.html",
                    controller: "KnowledgerateController"
                }
            }

        })
        .state('Risktakingrate', {
            url: "/Start",
            views: {
                "viewA": {
                    templateUrl: "Risktakingrate/Risktakingrate.html",
                    controller: "RisktakingrateController"
                }
            }

        })
    });