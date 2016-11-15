using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Plan
/// </summary>
public class Plan
{
	public Plan()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public string name { get; set; }
    public string email { get; set; }
    public string mobile { get; set; }
    public string currrentage { get; set; }
    public string retirementage { get; set; }
    public string lifeexpentency { get; set; }
    public string status { get; set; }
    public string Risk_Ability { get; set; }
    public string E_Fund_Amount { get; set; }
    public string E_Fund_SIP { get; set; }
    public string Risk_T_Insurance { get; set; }
    public string Risk_FF_Insurance { get; set; }
    public bool Retire { get; set; }
    public string Retire_Amount { get; set; }
    public string Retire_SIP { get; set; }
    public bool Vacation { get; set; }
    public string Vacation_Amount { get; set; }
    public string Vacation_SIP { get; set; }
    public bool Asset { get; set; }
    public string Asset_Amount { get; set; }
    public string Asset_SIP { get; set; }
    public bool other { get; set; }
    public string other_Amount { get; set; }
    public string other_SIP { get; set; }
    public bool ChildE { get; set; }
    public string ChildE_Amount { get; set; }
    public string ChildE_SIP { get; set; }
    public bool ChildM { get; set; }
    public string ChildM_Amount { get; set; }
    public string ChildM_SIP { get; set; }
    public string chartdata { get; set; }
    public string illness { get; set; }
    public string Schemes { get; set; }
}