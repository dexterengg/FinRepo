using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.IO;

public partial class MyDetails : System.Web.UI.Page
{
    SqlConnection Con = new SqlConnection(ConfigurationManager.ConnectionStrings["con"].ToString());
    string xStr = "";
    SqlCommand cmd;
    string xRiskCode = "0";
    public string CsVariable = "0";


    // Connection from My-portfolio
    SqlConnection mycon = new SqlConnection(ConfigurationManager.ConnectionStrings["mycon"].ToString());
    string xMyStr = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if ((string)Session["userSessionID"] != null)
            {
                string xCode = Session["userSessionID"].ToString();

                //Code for update riskcode
                xRiskCode = Request.QueryString["risk"];
                if (xRiskCode == "A")
                { }
                else
                {
                    Con.Open();
                    // Code for Planner Role
                    xStr = "update fp_Prospects set RiskCode='" + xRiskCode + "' where userid='" + xCode + "'";

                    SqlCommand cmd = new SqlCommand(xStr, Con);
                    cmd.ExecuteNonQuery();
                    Con.Close();
                } 


                // Code for populate client details

                FillPersonalDetail();

                // show planoutput button
                String xPO = "";
                SqlDataAdapter POGDA = new SqlDataAdapter(" " +

                        " select * from fp_investments where clientcode=(select code from fp_prospects where userid='" + xCode + "') " +
                        "  ", Con);

                DataSet POGDS = new DataSet();
                Con.Open();
                POGDA.Fill(POGDS);
                Con.Close();

                if (POGDS.Tables[0].Rows.Count > 0)
                {
                    btnMFPaidPlanOutPut.Visible = true;
                    btnStockPaidPlanOutput.Visible = true;
                    btnFIPaidPlanOutput.Visible = true;
                    btnOPaidPlanOutput.Visible = true;
                }

                // select code for groupcode
                String xOpType = "";
                SqlDataAdapter GDA = new SqlDataAdapter(" " +

                        " select * from fp_Prospects where UserID='" + xCode + "' " +
                        "  ", Con);

                DataSet GDS = new DataSet();
                Con.Open();
                GDA.Fill(GDS);
                Con.Close();

                if (GDS.Tables[0].Rows.Count > 0)
                {
                    txtSessionUserID.Value = GDS.Tables[0].Rows[0]["Code"].ToString();
                    xOpType = GDS.Tables[0].Rows[0]["OpType1"].ToString();
                }

                if (xOpType == "Paid")
                {
                    familydetail.Visible = true;
                    incomeExpense.Visible = true;
                    assetLiability.Visible = true;
                    investments.Visible = true;
                    insuranceLife.Visible = true;

                }
                else
                {
                    familydetail.Visible = true;
                    incomeExpense.Visible = true;
                    assetLiability.Visible = true;
                    investments.Visible = true;
                    insuranceLife.Visible = true; ;
                }

                
                // Code for relationship Combo

                SqlDataAdapter RDA = new SqlDataAdapter(" " +

                " select * from fp_ComboDetail where comboCode=3 " +
                "  ", Con);

                DataSet RDS = new DataSet();
                Con.Open();
                RDA.Fill(RDS);
                Con.Close();

                txtFRelationship.DataSource = RDS;
                txtFRelationship.DataTextField = "Name";
                txtFRelationship.DataValueField = "Code";
                txtFRelationship.DataBind();

                // ********************************************
                // Goal section Loading
                // Code for Goal Category Combo

                SqlDataAdapter GoalDA = new SqlDataAdapter(" " +

                " select * from fp_GoalMaster order by GoalName " +
                "  ", Con);

                DataSet GoalDS = new DataSet();
                Con.Open();
                GoalDA.Fill(GoalDS);
                Con.Close();

                txtGoalCategory.DataSource = GoalDS;
                txtGoalCategory.DataTextField = "GoalName";
                txtGoalCategory.DataValueField = "Code";
                txtGoalCategory.DataBind();

                // Code to check goal
                // select code for groupcode
                
                SqlDataAdapter GDAGC = new SqlDataAdapter(" " +

                    " select * from fp_goaldetails where GroupCode=(select Code from fp_prospects where userid='" + xCode + "') " +                        
                    "  ", Con);

                DataSet GDSGC = new DataSet();
                Con.Open();
                GDAGC.Fill(GDSGC);
                Con.Close();

                if (GDSGC.Tables[0].Rows.Count > 0)
                {
                    btnPlanOutPutRet.Visible = true;
                }


                // Code for Family Member for Combo

                SqlDataAdapter GoalfDA = new SqlDataAdapter(" " +

                " select Code, Name from fp_prospectsFamily " +
                " where groupcode=(select code from fp_prospects where userid='" + xCode + "') " +
                " union " +
                " select code=0, Name='Self' from fp_prospects where userid='" + xCode + "' " +
                "  ", Con);

                DataSet GoalfDS = new DataSet();
                Con.Open();
                GoalfDA.Fill(GoalfDS);
                Con.Close();               
                
                // For Asset Owner selection
                txtAssetOwner.DataSource = GoalfDS;
                txtAssetOwner.DataTextField = "Name";
                txtAssetOwner.DataValueField = "Code";
                txtAssetOwner.DataBind();

                // For LI Insured Name selection
                txtLIInsuredName.DataSource = GoalfDS;
                txtLIInsuredName.DataTextField = "Name";
                txtLIInsuredName.DataValueField = "Code";
                txtLIInsuredName.DataBind();                

                // For GI Proposer Name selection
                txtGIProposerName.DataSource = GoalfDS;
                txtGIProposerName.DataTextField = "Name";
                txtGIProposerName.DataValueField = "Code";
                txtGIProposerName.DataBind();

                // For Holder Name selection
                DDHolderNane.DataSource = GoalfDS;
                DDHolderNane.DataTextField = "Name";
                DDHolderNane.DataValueField = "Code";
                DDHolderNane.DataBind();


                // Code for Family Member Combo for LI Nominee

                SqlDataAdapter NoDA = new SqlDataAdapter(" " +

                " select Code, Name from fp_prospectsFamily " +
                " where groupcode=(select code from fp_prospects where userid='" + xCode + "') " +                
                "  ", Con);

                DataSet NoDS = new DataSet();
                Con.Open();
                NoDA.Fill(NoDS);
                Con.Close();

                // For LI Nominee Name selection
                txtLINomineeName.DataSource = NoDS;
                txtLINomineeName.DataTextField = "Name";
                txtLINomineeName.DataValueField = "Code";
                txtLINomineeName.DataBind();

                // ********************************************
                // Asset section Loading
                // Code for Asset Type Combo

                SqlDataAdapter AssetDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=8 order by "+
                " case when Name='Fixed Deposit' then 1 when Name='PPF' then 2 "+
                " when Name='KVP' then 3 when Name='Gold' then 4 "+
                " when Name='Property' then 5 when Name='Share' then 6 "+
                " when Name='Vehicle' then 7 when Name='Cash' then 8 "+
                " when Name='Other' then 9 end " +
                "  ", Con);

                DataSet AssetDS = new DataSet();
                Con.Open();
                AssetDA.Fill(AssetDS);
                Con.Close();

                txtAssetType.DataSource = AssetDS;
                txtAssetType.DataTextField = "Name";
                txtAssetType.DataValueField = "Code";
                txtAssetType.DataBind();

                //lblAccDate.Visible = false;
                //txtAccquisitionDate.Visible = false;
                RequiredFieldAccDate.Visible = false;
                //lblPurchasePrice.Visible = false;
                //txtAssetPurchasePrice.Visible = false;
                RequiredFieldAssetPurchasePrice.Visible = false;
                
                // Income section Loading
                // Code for Income Type Combo

                SqlDataAdapter IncomeDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=4 order by "+
                " case when Name='Salary' then 1 when Name='Performance' then 2 "+
                " when Name='Rental' then 3 when Name='Investment' then 4 "+
                " when Name='Business' then 5 when Name='Other' then 6 end " +
                "  ", Con);

                DataSet IncomeDS = new DataSet();
                Con.Open();
                IncomeDA.Fill(IncomeDS);
                Con.Close();

                txtIncomeType.DataSource = IncomeDS;
                txtIncomeType.DataTextField = "Name";
                txtIncomeType.DataValueField = "Code";
                txtIncomeType.DataBind();

                // Expense section Loading
                // Code for Expense Type Combo

                SqlDataAdapter ExpenseDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=5 and ParentCode is NULL  order by Name " +
                "  ", Con);

                DataSet ExpenseDS = new DataSet();
                Con.Open();
                ExpenseDA.Fill(ExpenseDS);
                Con.Close();

                txtExpenseType.DataSource = ExpenseDS;
                txtExpenseType.DataTextField = "Name";
                txtExpenseType.DataValueField = "Code";
                txtExpenseType.DataBind();
                                
                
                // Life Insurance section Loading
                // Code for Insurance Type Combo

                SqlDataAdapter LIDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=10 and ParentCode is NULL  order by Name " +
                "  ", Con);

                DataSet LIDS = new DataSet();
                Con.Open();
                LIDA.Fill(LIDS);
                Con.Close();

                txtLIInsuranceType.DataSource = LIDS;
                txtLIInsuranceType.DataTextField = "Name";
                txtLIInsuranceType.DataValueField = "Code";
                txtLIInsuranceType.DataBind();                
                                
                // Health Insurance section Loading
                // Code for Policy Type Combo

                SqlDataAdapter GIDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=12 order by Name " +
                "  ", Con);

                DataSet GIDS = new DataSet();
                Con.Open();
                GIDA.Fill(GIDS);
                Con.Close();

                txtGIInsuredObject.DataSource = GIDS;
                txtGIInsuredObject.DataTextField = "Name";
                txtGIInsuredObject.DataValueField = "Code";
                txtGIInsuredObject.DataBind();
                
                // Loan section Loading
                // Code for loan Type Combo

                SqlDataAdapter LoanDA = new SqlDataAdapter(" " +

                " select Name, Code from fp_ComboDetail where Combocode=9 order by Name " +
                "  ", Con);

                DataSet LoanDS = new DataSet();
                Con.Open();
                LoanDA.Fill(LoanDS);
                Con.Close();

                DDLoanTaken.DataSource = LoanDS;
                DDLoanTaken.DataTextField = "Name";
                DDLoanTaken.DataValueField = "Code";
                DDLoanTaken.DataBind();
                
                FillGridFamily();
                FillGridGoal();
                FillGridRetirementGoal();
                FillGridAsset();
                FillGridLoan();
                FillGridIncome();
                FillGridExpense();
                FillGridLI();
                FillGridGI();
                FillGridMFInvestments();
                FillGridStock();
                FillGridFixedIncome();
                FillGridOtherIncome();
            }
            else
            {
                Response.Redirect("SessionExpired.aspx");
            }

        }
    }

    //**********************************************
    //********Code start for My Detail ********
    //**********************************************

    void FillPersonalDetail()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter DA = new SqlDataAdapter(" " +

                    " select * from fp_Prospects where UserID='" + xCode + "' " +
                    "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();

            if (DS.Tables[0].Rows.Count > 0)
            {
                txtName.Text = DS.Tables[0].Rows[0]["Name"].ToString();
                txtGender.SelectedValue = DS.Tables[0].Rows[0]["Gender"].ToString();
                if (Convert.ToInt16(DS.Tables[0].Rows[0]["DOB"].ToString().Length) > 0)
                    txtDOB.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["DOB"].ToString()).ToString("dd-MM-yyyy");
                txtEmail.Text = DS.Tables[0].Rows[0]["Email1"].ToString();
                ddMaritalStatus.SelectedValue = DS.Tables[0].Rows[0]["MaritalStatus"].ToString();
                txtContact.Text = DS.Tables[0].Rows[0]["Mobile1"].ToString();
                txtGrossIncome.Text = DS.Tables[0].Rows[0]["GrossIncome"].ToString();                
                //if (Convert.ToInt16(DS.Tables[0].Rows[0]["AnniversaryDate"].ToString().Length) > 0)
                //    txtAnniDate.Text = Convert.ToDateTime(DS.Tables[0].Rows[0]["AnniversaryDate"].ToString()).ToString("yyyy-MM-dd");

                //if (Convert.ToInt16(DS.Tables[0].Rows[0]["DOB"].ToString().Length) > 0)
                //{
                //    view2.Visible = true;
                //    view3.Visible = true;
                //    view4.Visible = true;
                //    view5.Visible = true;
                //}

            }
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void MyDetailSubmit_Click(object sender, EventArgs e)
    {
        
        if ((string)Session["userSessionID"] != null)
        {
            string xDOBDate = "NULL";
            if (txtDOB.Text != "")
            {
                //xDOBDate = "'" + Convert.ToDateTime(txtDOB.Text).ToString("yyyy-MM-dd") + "'";
                xDOBDate = "'" + txtDOB.Text.Substring(6, 4) + '-' + txtDOB.Text.Substring(3, 2) + '-' + txtDOB.Text.Substring(0, 2) + "'";
            }

            //string xAnnDate = "NULL";
            //if (txtAnniDate.Text != "")
            //{
            //    xAnnDate = "'" + Convert.ToDateTime(txtAnniDate.Text).ToString("yyyy-MM-dd") + "'";
            //}

            string xCode = Session["userSessionID"].ToString();
            xStr = " update fp_prospects set Name='" + txtName.Text + "',    " +
                " Gender='" + txtGender.SelectedValue + "', " +
                " DOB=" + xDOBDate + ", " +
                " Email1='" + txtEmail.Text + "', " +
                " Mobile1='" + txtContact.Text + "', " +
                " GrossIncome='" + txtGrossIncome.Text + "', " +                
                " Salutation='" + ddSalutation.SelectedValue + "', " +
                " ClientStatus='X', " +
                " Country='India', " +
                " MaritalStatus='" + ddMaritalStatus.SelectedValue + "' " +
                " where UserID='" + xCode + "'  ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();

            FillPersonalDetail();

            //ScriptManager.RegisterClientScriptBlock(this, typeof(Page), "anything", "alert('Your Data Submitted Sucessfully');", true);            

            myDetailsSave.Visible = true;
            CsVariable = "1";


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
        
    }

    //**********************************************
    //********Code start for Family Details ********
    //**********************************************

    protected void FamilyDetailSubmit_Click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            //string xFDOBDate = "NULL";
            //if (txtFDOB.Text != "")
            //{
            //    xFDOBDate = "'" + Convert.ToDateTime(txtFDOB.Text).ToString("yyyy-MM-dd") + "'";
            //}

            string xCode = Session["userSessionID"].ToString();

            // insert code for family details
            xStr = " Insert into fp_prospectsFamily(GroupCode,Name,Gender,Age,Relation,FinancialDependent,HealthHistory)   " +
                " values(" + txtSessionUserID.Value + ",'" + txtFName.Text + "','" + txtFGender.Text + "', '" + txtAge.Text + "', '" + txtFRelationship.SelectedValue + "','" + txtFDependent.SelectedValue + "','" + txtFHealthHistory.Text + "') ";

            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridFamily();

            txtFName.Text = "";
            txtAge.Text = "";
            txtFHealthHistory.Text = "";

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGridFamily()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code,Name, Gender=case when Gender='F' then 'Female' else 'Male' end, " +
                    " Age, Mobile1, " +
                    " Relation=(select Name from fp_ComboDetail where ComboCode=3 and Code=Relation)," +
                    " FinancialDependent=case when FinancialDependent='Y' then 'Yes' else 'No' end, " +
                    " HealthHistory from fp_ProspectsFamily where GroupCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewFamily.DataSource = GDS;
            GridViewFamily.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }    

    protected void GridViewFamily_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewFamily.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblID");
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_prospectsFamily where Code='" + Convert.ToInt32(GridViewFamily.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridFamily();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewFamily_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewFamily.EditIndex = e.NewEditIndex;

        FillGridFamily();
    }
    protected void GridViewFamily_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewFamily.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewFamily.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblID");

        TextBox textName = (TextBox)row.Cells[1].Controls[0];
        TextBox textAge = (TextBox)row.Cells[4].Controls[0];
        TextBox textHealthHistory = (TextBox)row.Cells[6].Controls[0];

        GridViewFamily.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_prospectsFamily set Name='" + textName.Text + "', Age='" + textAge.Text + "', HealthHistory='" + textHealthHistory.Text + "' where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridFamily();

    }
    protected void GridViewFamily_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewFamily.EditIndex = -1;
        FillGridFamily();
    }
    // Code for showing tooltip on Edit/Delete/Update/Cancel button    
    protected void GridViewFamily_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        try
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[4].ToolTip = "Edit Resource Details";
                if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState.ToString() == "Alternate, Edit")
                {
                    int i = 0;
                    foreach (TableCell cell in e.Row.Cells)
                    {
                        if (e.Row.Cells.GetCellIndex(cell) == 4)
                        {
                            ((System.Web.UI.WebControls.ImageButton)(e.Row.Cells[4].Controls[0])).ToolTip = "Update Resource Details";
                            ((System.Web.UI.LiteralControl)(e.Row.Cells[4].Controls[1])).Text = "&nbsp;";
                            ((System.Web.UI.WebControls.ImageButton)(e.Row.Cells[4].Controls[2])).ToolTip = "Close Resource Details";
                        }
                        i++;
                    }
                }
            }
        }
        catch (Exception _e)
        {
        }
    }


    //**********************************************
    //********Code start for My Requirement ********
    //**********************************************

    protected void GoalRequirementSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            //***************************************
            //*****insert code for My Requirement****
            //***************************************

            string xStartDate = "NULL";
            if (txtGoalMonth.Text != "")
            {
                xStartDate = "'" + Convert.ToDateTime(txtGoalMonth.Text).ToString("yyyy-MM-dd") + "'";
            }

            string xAmount = "NULL";
            if (txtOwnAmount.Text != "")
            {
                xAmount = "'" + txtOwnAmount.Text + "'";
            }

            string xCurrentExp = "NULL";
            if (txtCurrentExp.Text != "")
            {
                xCurrentExp = "'" + txtCurrentExp.Text + "'";
            }

            string xLifeExpectancy = "NULL";
            if (txtLifeExpectancy.Text != "")
            {
                xLifeExpectancy = "'" + txtLifeExpectancy.Text + "'";
            }

            string gn = txtGoalName.Text;
            string xGName = gn.Replace("'", "''");

            //string r = txtRemark.Text;
            //string xRemark = r.Replace("'", "''");



            xStr = " Insert into fp_GoalDetails(GroupCode,GoalCode,GoalName,StartDate,Amount,CurrentExpenditure, LifeExpectancy, EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + txtGoalCategory.SelectedValue + ",'" + xGName + "', " +
                " " + xStartDate + "," + xAmount + ", " + xCurrentExp + ", " + xLifeExpectancy + ", " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridGoal();
            FillGridRetirementGoal();

            txtGoalName.Text = "";
            txtGoalMonth.Text = "";
            txtOwnAmount.Text = "";
            txtCurrentExp.Text = "";
            //txtRemark.Text = "";
            txtLifeExpectancy.Text = "";

            btnPlanOutPutRet.Visible = true;
            


        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void txtGoalCategory_change(object sender, EventArgs e)
    {
        if (txtGoalCategory.SelectedValue.ToString() == "7")
        {
            lblCurexp.Visible = true;
            txtCurrentExp.Visible = true;
            RequiredFieldCurrentExpenditure.Visible = true;
            lblLifeExpectancy.Visible = true;
            txtLifeExpectancy.Visible = true;
            RequiredFieldLifeExpectancy.Visible = true;
            lblOwnAmount.Visible = false;
            txtOwnAmount.Visible = false;
            RequiredFieldOwnAmountRequired.Visible = false;
            RequiredFieldRetYear.Visible = true;
            lblRetYear.Visible = true;
            RequiredFieldStartDate.Visible = false;
            lblGoalYear.Visible = false;
            GoalNameEg.Text = "";
        }
        else
        {
            lblCurexp.Visible = false;
            txtCurrentExp.Visible = false;
            RequiredFieldCurrentExpenditure.Visible = false;
            lblLifeExpectancy.Visible = false;
            txtLifeExpectancy.Visible = false;
            RequiredFieldLifeExpectancy.Visible = false;
            lblOwnAmount.Visible = true;
            txtOwnAmount.Visible = true;
            RequiredFieldOwnAmountRequired.Visible = true;
            RequiredFieldRetYear.Visible = false;
            lblRetYear.Visible = false;
            RequiredFieldStartDate.Visible = true;
            lblGoalYear.Visible = true;
        }
        if (txtGoalCategory.SelectedValue.ToString() == "1")
        {
            GoalNameEg.Text = "for e.g., My Dream Car.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "2")
        {
            GoalNameEg.Text = "for e.g., My Children's Education.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "3")
        {
            GoalNameEg.Text = "for e.g., My Dream House.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "4")
        {
            GoalNameEg.Text = "for e.g., Daughter's Marriage.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "6")
        {
            GoalNameEg.Text = "for e.g., My Dream Property.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "7")
        {
            GoalNameEg.Text = "for e.g., My Retirement.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "9")
        {
            GoalNameEg.Text = "for e.g., My Holiday.";
        }
        if (txtGoalCategory.SelectedValue.ToString() == "5" || txtGoalCategory.SelectedValue.ToString() == "8")
        {
            GoalNameEg.Text = "";
        }
    }

    void FillGridGoal()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, GoalCategory=(select GoalName from fp_goalMaster gm where Code=GoalCode), " +
                    " GoalFor=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " GoalName, Priority, GoalDate=Convert(varchar(11),StartDate,113), EndDate, Amount,LifeExpectancy," +
                    " RetirementAge, CurrentExpenditure, RequiredInflow, Remarks   " +
                    " from fp_GoalDetails where GoalCode<>7 and GroupCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewGoal.DataSource = GDS;
            GridViewGoal.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }       

    protected void GridViewGoal_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewGoal.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_GoalDetails where Code='" + Convert.ToInt32(GridViewGoal.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridGoal();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewGoal_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewGoal.EditIndex = e.NewEditIndex;

        FillGridGoal();
    }
    protected void GridViewGoal_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewGoal.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewGoal.Rows[e.RowIndex];

        TextBox GoalName = (TextBox)row.Cells[2].Controls[0];
        TextBox GoalAmount = (TextBox)row.Cells[6].Controls[0];

        GridViewGoal.EditIndex = -1;
        Con.Open();

        string r = GoalName.Text;
        string xGoalNme = r.Replace("'", "''");

        SqlCommand cmd = new SqlCommand("update fp_GoalDetails set GoalName='" + xGoalNme + "', Amount=" + GoalAmount.Text + " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridGoal();

    }
    protected void GridViewGoal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewGoal.EditIndex = -1;
        FillGridGoal();
    }

    void FillGridRetirementGoal()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, GoalCategory=(select GoalName from fp_goalMaster gm where Code=GoalCode), " +
                    " GoalFor=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " GoalName, Priority, GoalDate=Convert(varchar(11),StartDate,113), EndDate, Amount,LifeExpectancy," +
                    " RetirementAge, CurrentExpenditure, RequiredInflow, Remarks   " +
                    " from fp_GoalDetails where GoalCode=7 and GroupCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewRetirementGoal.DataSource = GDS;
            GridViewRetirementGoal.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewRetirementGoal_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewRetirementGoal.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_GoalDetails where Code='" + Convert.ToInt32(GridViewRetirementGoal.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridRetirementGoal();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewRetirementGoal_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewRetirementGoal.EditIndex = e.NewEditIndex;

        FillGridRetirementGoal();
    }
    protected void GridViewRetirementGoal_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewRetirementGoal.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewRetirementGoal.Rows[e.RowIndex];

        TextBox GoalName = (TextBox)row.Cells[2].Controls[0];
        TextBox GoalAmount = (TextBox)row.Cells[6].Controls[0];

        GridViewRetirementGoal.EditIndex = -1;
        Con.Open();

        string r = GoalName.Text;
        string xGoalNme = r.Replace("'", "''");

        SqlCommand cmd = new SqlCommand("update fp_GoalDetails set GoalName='" + xGoalNme + "', Amount=" + GoalAmount.Text + " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridRetirementGoal();

    }
    protected void GridViewRetirementGoal_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewRetirementGoal.EditIndex = -1;
        FillGridRetirementGoal();
    }

    //**********************************************
    //********Code start for Asset ********
    //**********************************************

    protected void AssetSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            //***************************************
            //*****insert code for Asset****
            //***************************************

            string xAccqDate = "NULL";
            if (txtAccquisitionDate.Text != "")
            {
                xAccqDate = "'" + Convert.ToDateTime(txtAccquisitionDate.Text).ToString("yyyy-MM-dd") + "'";
            }

            string xCurrentVal = "NULL";
            if (txtAssetCurrentValue.Text != "")
            {
                xCurrentVal = "'" + txtAssetCurrentValue.Text + "'";
            }

            string xPurchasePrice = "NULL";
            if (txtAssetPurchasePrice.Text != "")
            {
                xPurchasePrice = "'" + txtAssetPurchasePrice.Text + "'";
            }


            xStr = " Insert into fp_AssetDetail(ClientCode,AssetCode,CurrentValue,PurchasePrice,AccquisitionDate,FamilyMemberCode)   " +
                " values(" + txtSessionUserID.Value + "," + txtAssetType.SelectedValue + "," + xCurrentVal + ", " +
                " " + xPurchasePrice + "," + xAccqDate + ", " + txtAssetOwner.SelectedValue + " " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridAsset();
            
            txtAssetCurrentValue.Text = "";
            txtAssetPurchasePrice.Text = "";
            txtAccquisitionDate.Text = "";

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    void FillGridAsset()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, AssetType=(select [Name] from fp_ComboDetail where Code=AssetCode), " +
                    " AssetOwner=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), " +
                    " AssetName, CurrentValue, PurchasePrice, AccqDate=Convert(varchar(11),AccquisitionDate,113) " +
                    " from fp_AssetDetail where ClientCode=(select code from fp_Prospects where UserID='" + xCode + "')  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewAsset.DataSource = GDS;
            GridViewAsset.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewAsset_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewAsset.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_AssetDetail where Code='" + Convert.ToInt32(GridViewAsset.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridAsset();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewAsset_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewAsset.EditIndex = e.NewEditIndex;

        FillGridAsset();
    }
    protected void GridViewAsset_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewAsset.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewAsset.Rows[e.RowIndex];

        //TextBox AssetName = (TextBox)row.Cells[3].Controls[0];
        TextBox CurrentPrice = (TextBox)row.Cells[4].Controls[0];
        TextBox PurchasePrice = (TextBox)row.Cells[5].Controls[0];

        GridViewAsset.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_AssetDetail set CurrentValue=" + CurrentPrice.Text + ", PurchasePrice=" + PurchasePrice.Text + " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridAsset();

    }
    protected void GridViewAsset_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewAsset.EditIndex = -1;
        FillGridAsset();
    }
    //protected void txtAssetType_change(object sender, EventArgs e)
    //{
    //    if (txtAssetType.SelectedItem.ToString() == "Others")
    //    {
    //        lblAccDate.Visible = false;
    //        txtAccquisitionDate.Visible = false;
    //        RequiredFieldAccDate.Visible = false;
    //        lblPurchasePrice.Visible = false;
    //        txtAssetPurchasePrice.Visible = false;
    //        RequiredFieldAssetPurchasePrice.Visible = false;

    //    }
    //    else
    //    {
    //        lblAccDate.Visible = true;
    //        txtAccquisitionDate.Visible = true;
    //        RequiredFieldAccDate.Visible = true;
    //        lblPurchasePrice.Visible = true;
    //        txtAssetPurchasePrice.Visible = true;
    //        RequiredFieldAssetPurchasePrice.Visible = true;
    //    }
    //}


    //**********************************************
    //********Code start for Loan/Liability ********
    //**********************************************

    protected void LoanSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            xStr = " insert into fp_Loan(ClientCode,LoanTaken,OriginalAmount,RateofInterest,LoanType,EMI,LoanTenure,OutStandingBalance,StartDate,EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + DDLoanTaken.SelectedValue + "," + txtOriginalAmt.Text + ",'" + txtRateofInterest.Text + "','" + DDLoanType.SelectedValue + "', " +
                " " + txtEMI.Text + ", " + txtLoanTenure.Text + ", " + txtOutstandingBal.Text + ", '" + txtStartDate .Text+ "', " +                
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLoan();

            
            txtLoanTenure.Text = "";
            txtRateofInterest.Text = "";
            txtOriginalAmt.Text = "";
            txtEMI.Text = "";
            txtOutstandingBal.Text = "";
            txtStartDate.Text = "";                       
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    
    void FillGridLoan()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, LoanTakenFor=(Select [Name] from fp_ComboDetail where Code=r.LoanTaken ), "+
                    " OriginalAmount,RateofInterest,LoanType,EMI,LoanTenure,OutStandingBalance,StartDate=convert(varchar(11),StartDate,113) " +                    
                    " from fp_Loan r where ClientCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLoan.DataSource = GDS;
            GridViewLoan.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewLoan_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewLoan.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Loan where Code='" + Convert.ToInt32(GridViewLoan.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLoan();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewLoan_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewLoan.EditIndex = e.NewEditIndex;

        FillGridLoan();
    }
    protected void GridViewLoan_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewLoan.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewLoan.Rows[e.RowIndex];

        TextBox gvroi = (TextBox)row.Cells[5].Controls[0];

        GridViewLoan.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Loan set RateofInterest=" + gvroi.Text + " where Code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridLoan();

    }
    protected void GridViewLoan_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewLoan.EditIndex = -1;
        FillGridLoan();
    }

    protected void DDAssetLiability_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDAssetLiability.SelectedItem.ToString() == "Assets")
        {
            UpdatePanelAsset.Visible = true;
            UpdatePanelLiability.Visible = false;
        }
        else
        {
            UpdatePanelAsset.Visible = false;
            UpdatePanelLiability.Visible = true;
        }
    }

    //**********************************************
    //********Code start for Income ********
    //**********************************************
    
    protected void IncomeSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            xStr = " Insert into fp_Income(ClientCode,Source,IncomeMonthly,IncomePeriod,EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + txtIncomeType.SelectedValue + ", " + txtIncomeAmount.Text + ", " +
                " '" + DDIncomePeriod.SelectedValue + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridIncome();

            txtIncomeAmount.Text = "";            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }    

    void FillGridIncome()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, IncomeType=(select [Name] from fp_ComboDetail where Code=Source), "+
                    " IncomeAmount=IncomeMonthly, IncomePeriod  "+                    
                    " from fp_Income where ClientCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewIncome.DataSource = GDS;
            GridViewIncome.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewIncome_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewIncome.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Income where Code='" + Convert.ToInt32(GridViewIncome.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridIncome();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewIncome_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewIncome.EditIndex = e.NewEditIndex;

        FillGridIncome();
    }
    protected void GridViewIncome_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewIncome.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewIncome.Rows[e.RowIndex];

        TextBox IncomeAmount = (TextBox)row.Cells[2].Controls[0];        

        GridViewIncome.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Income set IncomeMonthly=" + IncomeAmount.Text + " where Code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridIncome();

    }
    protected void GridViewIncome_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewIncome.EditIndex = -1;
        FillGridIncome();
    }
    protected void DDIncomeExpense_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDIncomeExpense.SelectedItem.ToString() == "Income")
        {
            UpdatePanelIncome.Visible = true;
            UpdatePanelExpenses.Visible = false;
        }
        else
        {
            UpdatePanelIncome.Visible = false;
            UpdatePanelExpenses.Visible = true;
        }
    }

    //**********************************************
    //********Code start for Expenses ********
    //**********************************************
    
    protected void ExpenseSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            xStr = " Insert into fp_Expense(ClientCode,Source,ExpenseMonthly,ExpensePeriod,EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + txtExpenseType.SelectedValue + "," + txtExpenseAmount.Text + ", " +
                " '" + DDExpensePeriod.SelectedValue + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +                
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridExpense();

            txtExpenseAmount.Text = "";            
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGridExpense()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, ExpenseType=(select [Name] from fp_ComboDetail where Code=Source), "+
                    " ExpenseAmount=ExpenseMonthly, ExpensePeriod " +                    
                    " from fp_Expense where ClientCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewExpense.DataSource = GDS;
            GridViewExpense.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    
    protected void GridViewExpense_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewExpense.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Expense where Code='" + Convert.ToInt32(GridViewExpense.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridExpense();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewExpense_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewExpense.EditIndex = e.NewEditIndex;

        FillGridExpense();
    }
    protected void GridViewExpense_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewExpense.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewExpense.Rows[e.RowIndex];

        TextBox ExpenseAmount = (TextBox)row.Cells[2].Controls[0];

        GridViewExpense.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Expense set ExpenseMonthly=" + ExpenseAmount.Text + " where Code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridExpense();

    }
    protected void GridViewExpense_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewExpense.EditIndex = -1;
        FillGridExpense();
    }

    //**********************************************
    //********Code start for Life Insurance ********
    //**********************************************
    
    protected void LISubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            string xLICurrentValue = "NULL";
            if (txtLICurrentValue.Text != "")
            {
                xLICurrentValue = "'" + txtLICurrentValue.Text + "'";
            }

            string xLIMaturityDate = "NULL";
            if (txtMaturityDate.Text != "")
            {
                xLIMaturityDate = "'" + Convert.ToDateTime(txtMaturityDate.Text).ToString("yyyy-MM-dd") + "'";
            }


            string xLIPolicyStartDate = "NULL";
            if (txtLIPolicyStartDate.Text != "")
            {
                xLIPolicyStartDate = "'" + Convert.ToDateTime(txtLIPolicyStartDate.Text).ToString("yyyy-MM-dd") + "'";
            }

            xStr = " Insert into fp_Insurance(ClientCode,FamilyMemberCode,Product,InsType,PolicyName, " +
                " NomineeName,SumAssured,PolicyStartDate,CurrentValue,PremiumMode,Premium, " +
                " PremiumPaymentTerm,MaturityDate,EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + txtLIInsuredName.SelectedValue + ",'LI'," + txtLIInsuranceType.SelectedValue + ", " +
                " '" + txtLIPolicyName.Text + "', " + txtLINomineeName.SelectedValue + ", " + txtLISumAssured.Text + ",  " +
                " " + xLIPolicyStartDate + ", " + xLICurrentValue + ", '" + txtPremiumMode.SelectedValue + "', " +
                " '" + txtLIPremium.Text + "', '" + txtPremiumPayingTerm.Text + "', " + xLIMaturityDate + ",  " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLI();             

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }    

    void FillGridLI()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, PolicyName, Applicant=isnull((Select [Name] from fp_prospectsfamily where Code=FamilyMemberCode ),'Self'), "+
                    " InsuranceType=(select [Name] from fp_Combodetail where Code=r.InsType ), PremiumPaymentTerm, PremiumMode, CurrentValue, "+
                    " Premium, SumAssured, Nominee=isnull((Select [Name] from fp_prospectsfamily where Code=NomineeName ),'Self'), "+
                    " StartDate=convert(varchar(11),PolicystartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) "+                    
                    " from fp_Insurance r where Product='LI' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewLI.DataSource = GDS;
            GridViewLI.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewLI_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewLI.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Insurance where Code='" + Convert.ToInt32(GridViewLI.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridLI();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewLI_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewLI.EditIndex = e.NewEditIndex;

        FillGridLI();
    }
    protected void GridViewLI_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewLI.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewLI.Rows[e.RowIndex];

        TextBox LIPaymentTerm = (TextBox)row.Cells[4].Controls[0];
        TextBox LICurrentValue = (TextBox)row.Cells[6].Controls[0];
        TextBox LIPremium = (TextBox)row.Cells[7].Controls[0];
        TextBox LISumAssured = (TextBox)row.Cells[8].Controls[0];

        string xxLICurrentValue = "NULL";
        if (LICurrentValue.Text != "")
        {
            xxLICurrentValue = "'" + LICurrentValue.Text + "'";
        }

        GridViewLI.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Insurance set PremiumPaymentTerm=" + LIPaymentTerm.Text + ", "+
            " CurrentValue=" + xxLICurrentValue + ", Premium=" + LIPremium.Text + ", SumAssured=" + LISumAssured.Text + " " +
            " where Code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridLI();

    }
    protected void GridViewLI_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewLI.EditIndex = -1;
        FillGridLI();
    }
    protected void btnPlanOutPut_Click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                            " select Risk=isnull(RiskCode,99) from fp_Prospects " +
                            " where userid='" + xCode + "'  " +                
                            "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();
            string xRisk="";
            if (DS.Tables[0].Rows.Count > 0)
            {
                xRisk = DS.Tables[0].Rows[0]["Risk"].ToString();
            }

            if (xRisk == "99")
            {
                Response.Redirect("RiskSelected.aspx");
            }
            else
            { Response.Redirect("FreePlanOutput.aspx");  }
            
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    //**********************************************
    //********Code start for Non Life Insurance ********
    //**********************************************

    protected void GISubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            string xGIStartDate = "NULL";
            if (txtGIPolicyStartDate.Text != "")
            {
                xGIStartDate = "'" + Convert.ToDateTime(txtGIPolicyStartDate.Text).ToString("yyyy-MM-dd") + "'";
            }

            xStr = " Insert into fp_Insurance(ClientCode,FamilyMemberCode,Product,InsType,PolicyName, " +
                " ProposerName,SumAssured,PolicyStartDate,Premium,PremiumMode,Remarks,EntryDate)   " +
                " values(" + txtSessionUserID.Value + "," + txtGIProposerName.SelectedValue + ",'GI'," + txtGIInsuredObject.SelectedValue + ", " +
                " '" + txtGIPolicyName.Text + "', " +
                " " + txtGIProposerName.SelectedValue + ", " + txtGISumAssured.Text + ", " + xGIStartDate + ", " +
                " '" + txtGIAnnualPremium.Text + "', '" + DDGIPaymentMode.SelectedValue + "',  " +
                " '" + txtGIRemarks.Value + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridGI();

            
            txtGIPolicyName.Text = "";            
            txtGISumAssured.Text = "";
            txtGIPolicyStartDate.Text = "";
            txtGIAnnualPremium.Text = "";            
            txtGIRemarks.Value = "";
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    void FillGridGI()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code, InsuredObject=(Select [Name] from fp_ComboDetail where Code=r.InsType ), "+
                    " PolicyHolderName=isnull((Select [Name] from fp_prospectsfamily where Code=r.ProposerName ),'Self'), "+
                    " PolicyName, Premium, PremiumMode, SumAssured, StartDate=convert(varchar(11),PolicystartDate,113) "+
                    " from fp_Insurance r where Product='GI' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "') " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewGI.DataSource = GDS;
            GridViewGI.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }

    protected void GridViewGI_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewGI.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Insurance where Code='" + Convert.ToInt32(GridViewGI.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridGI();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewGI_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewGI.EditIndex = e.NewEditIndex;

        FillGridGI();
    }
    protected void GridViewGI_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewGI.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewGI.Rows[e.RowIndex];

        TextBox GIPremium = (TextBox)row.Cells[4].Controls[0];

        GridViewGI.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Insurance set Premium=" + GIPremium.Text + " where Code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridGI();

    }
    protected void GridViewGI_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewGI.EditIndex = -1;
        FillGridGI();
    }
    protected void DDInsurance_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDInsurance.SelectedValue.ToString() == "Life")
        {
            UpdatePanelLife.Visible = true;
            UpdatePanelNonLife.Visible = false;
        }
        else
        {
            UpdatePanelLife.Visible = false;
            UpdatePanelNonLife.Visible = true;
        }
    }


    //**********************************************
    //********Code start for Investments ********
    //**********************************************

    protected void DDInvestments_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDInvestments.SelectedValue.ToString() == "Mutual Fund")
        {
            UpdatePanelMutualFund.Visible = true;
            UpdatePanelStock.Visible = false;
            UpdatePanelFixedIncome.Visible = false;
            UpdatePanelOtherInvestment.Visible = false;
        }
        if (DDInvestments.SelectedValue.ToString() == "Stock")
        {
            UpdatePanelMutualFund.Visible = false;
            UpdatePanelStock.Visible = true;
            UpdatePanelFixedIncome.Visible = false;
            UpdatePanelOtherInvestment.Visible = false;
        }
        if (DDInvestments.SelectedValue.ToString() == "Fixed Income")
        {
            UpdatePanelMutualFund.Visible = false;
            UpdatePanelStock.Visible = false;
            UpdatePanelFixedIncome.Visible = true;
            UpdatePanelOtherInvestment.Visible = false;
        }
        if (DDInvestments.SelectedValue.ToString() == "Others")
        {
            UpdatePanelMutualFund.Visible = false;
            UpdatePanelStock.Visible = false;
            UpdatePanelFixedIncome.Visible = false;
            UpdatePanelOtherInvestment.Visible = true;
        }
    }

    // For Mutual Fund Investments
    protected void MFSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();            

            string xMFStartDate = "NULL";
            if (txtMFStartDate.Text != "")
            {
                xMFStartDate = "'" + Convert.ToDateTime(txtMFStartDate.Text).ToString("yyyy-MM-dd") + "'";
            }

            string xMFEndDate = "NULL";
            if (txtMFEndDate.Text != "")
            {
                xMFEndDate = "'" + Convert.ToDateTime(txtMFEndDate.Text).ToString("yyyy-MM-dd") + "'";
            }


            xStr = " Insert into fp_Investments(ClientCode, ProductName, SchemeName, InvestmentType, InvestedAmount, CurrentValue, "+
                " SchemeOption, StartDate, EndDate, EntryDate)   " +
                " values(" + txtSessionUserID.Value + ",'Mutual Fund', '" + txtMFSchemeName.Text + "', '" + DDMFInvType .SelectedValue+ "', " +
                " '" + txtMFInvAmount.Text + "','" + txtCurrentValue.Text + "', '" + DDMFSchemeOption.SelectedValue + "', " +
                " " + xMFStartDate + ", " + xMFEndDate + ", '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridMFInvestments();

            txtMFSchemeName.Text = "";
            txtMFInvAmount.Text = "";
            txtCurrentValue.Text = "";

            btnMFPaidPlanOutPut.Visible = true;  

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    void FillGridMFInvestments()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, SchemeName, InvestmentType, InvestedAmount, CurrentValue, SchemeOption, "+
                    " StartDate=convert(varchar(11),StartDate,113), EndDate=convert(varchar(11),EndDate,113) " +
                    " from fp_Investments where ProductName='Mutual Fund' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "')  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewMFInvestments.DataSource = GDS;
            GridViewMFInvestments.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewMFInvestments_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewMFInvestments.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Investments where Code='" + Convert.ToInt32(GridViewMFInvestments.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridMFInvestments();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewMFInvestments_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewMFInvestments.EditIndex = e.NewEditIndex;

        FillGridMFInvestments();
    }
    protected void GridViewMFInvestments_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewMFInvestments.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewMFInvestments.Rows[e.RowIndex];
                
        TextBox xMFInvAmt = (TextBox)row.Cells[3].Controls[0];
        TextBox xMFCurrentVal = (TextBox)row.Cells[4].Controls[0];

        GridViewMFInvestments.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Investments set CurrentValue=" + xMFCurrentVal.Text + ", InvestedAmount=" + xMFInvAmt.Text + " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridMFInvestments();

    }
    protected void GridViewMFInvestments_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewMFInvestments.EditIndex = -1;
        FillGridMFInvestments();
    }

    // For Stock Investments
    protected void txtSPurchasePrice_change(object sender, EventArgs e)
    {
        txtSInvAmount.Text = (Convert.ToInt64(txtSPurchasePrice.Text) * Convert.ToInt64(txtNoShares.Text)).ToString();
    }
    protected void txtSCurrentPrice_change(object sender, EventArgs e)
    {
        txtSCurrentValue.Text = (Convert.ToInt64(txtSCurrentPrice.Text) * Convert.ToInt64(txtNoShares.Text)).ToString();

        txtSGainLoss.Text=((Convert.ToInt64(txtSCurrentValue.Text) - Convert.ToInt64(txtSInvAmount.Text)) * 100 / Convert.ToInt64(txtSInvAmount.Text)).ToString();
    }
    protected void StockButton_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            xStr = " Insert into fp_Investments(ClientCode, ProductName, SchemeName,NoShare,PurchasePrice,CurrentPrice, " +
                " InvestedAmount,CurrentValue,GainLoss,EntryDate)   " +
                " values(" + txtSessionUserID.Value + ",'Stock', '" + txtxStockName.Text + "', '" + txtNoShares.Text + "', " +
                " '" + txtSPurchasePrice.Text + "','" + txtSCurrentPrice.Text + "', '" + txtSInvAmount.Text + "', " +
                " '" + txtSCurrentValue.Text + "', '" + txtSGainLoss.Text + "', '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridStock();

            txtMFSchemeName.Text = "";
            txtMFInvAmount.Text = "";
            txtCurrentValue.Text = "";

            btnStockPaidPlanOutput.Visible = true;
            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    void FillGridStock()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select Code,SchemeName,NoShare,PurchasePrice,CurrentPrice,InvestedAmount,CurrentValue,GainLoss " +
                    " from fp_Investments where ProductName='Stock' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "')  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewStock.DataSource = GDS;
            GridViewStock.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewStock_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewStock.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Investments where Code='" + Convert.ToInt32(GridViewStock.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridStock();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewStock_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewStock.EditIndex = e.NewEditIndex;

        FillGridStock();
    }
    protected void GridViewStock_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewStock.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewStock.Rows[e.RowIndex];

        TextBox xMFInvAmt = (TextBox)row.Cells[3].Controls[0];
        TextBox xMFCurrentVal = (TextBox)row.Cells[4].Controls[0];

        GridViewStock.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Investments set CurrentValue=" + xMFCurrentVal.Text + ", InvestedAmount=" + xMFInvAmt.Text + " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridStock();

    }
    protected void GridViewStock_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewStock.EditIndex = -1;
        FillGridStock();
    }

    // For Fixed Income Investments
    protected void FISubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();

            string xFIStartDate = "NULL";
            if (txtFIStartDate.Text != "")
            {
                xFIStartDate = "'" + Convert.ToDateTime(txtFIStartDate.Text).ToString("yyyy-MM-dd") + "'";
            }

            string xFIMaturityDate = "NULL";
            if (txtFIMaturityDate.Text != "")
            {
                xFIMaturityDate = "'" + Convert.ToDateTime(txtFIMaturityDate.Text).ToString("yyyy-MM-dd") + "'";
            }


            xStr = " Insert into fp_Investments(ClientCode,ProductName, InvestmentType, InvestedAmount, CurrentValue, IssuingEntity,ROI, "+
                " HolderName, StartDate, MaturityDate,Remarks, EntryDate)   " +
                " values(" + txtSessionUserID.Value + ",'Fixed Income', '" + DDFIInvType.SelectedItem + "', '" + txtFIInvAmount.Text + "', " +
                " '" + txtFICurrentValue.Text + "','" + txtIssuingEntity.Text + "', '" + txtROI.Text + "', " +
                " '" + DDHolderNane.SelectedValue + "', " + xFIStartDate + ", " + xFIMaturityDate + ", '" + txtFIRemarks.Value+ "', " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridFixedIncome();

            txtFIInvAmount.Text = "";
            txtFICurrentValue.Text = "";
            txtIssuingEntity.Text = "";
            txtROI.Text = "";
            txtFIRemarks.Value = "";

            btnFIPaidPlanOutput.Visible = true;            

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    void FillGridFixedIncome()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, InvestmentType, InvestedAmount, CurrentValue, IssuingEntity,ROI, "+
                    " HolderName=(select [Name] from fp_prospectsfamily where Code=r.HolderName), " +
                    " StartDate=convert(varchar(11),StartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) " +
                    " from fp_Investments r where ProductName='Fixed Income' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "')  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewFixedIncome.DataSource = GDS;
            GridViewFixedIncome.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewFixedIncome_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewFixedIncome.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Investments where Code='" + Convert.ToInt32(GridViewFixedIncome.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridFixedIncome();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewFixedIncome_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewFixedIncome.EditIndex = e.NewEditIndex;
        FillGridFixedIncome();
    }
    protected void GridViewFixedIncome_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewFixedIncome.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewFixedIncome.Rows[e.RowIndex];

        TextBox xFIInvAmt = (TextBox)row.Cells[2].Controls[0];
        TextBox xFICurrentVal = (TextBox)row.Cells[3].Controls[0];
        TextBox xFIIssuingEntity = (TextBox)row.Cells[4].Controls[0];
        TextBox xFIROI = (TextBox)row.Cells[5].Controls[0];

        GridViewFixedIncome.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Investments set InvestedAmount=" + xFIInvAmt.Text + ", CurrentValue=" + xFICurrentVal.Text + ", "+
            " IssuingEntity='" + xFIIssuingEntity.Text + "', ROI='" + xFIROI .Text+ "' " +
            " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridFixedIncome(); 

    }
    protected void GridViewFixedIncome_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewFixedIncome.EditIndex = -1;
        FillGridFixedIncome();
    }

    // For Other Income Investments
    protected void OtherInvSubmit_click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {

            string xCode = Session["userSessionID"].ToString();            

            string xOIPurchaseDate = "NULL";
            if (txtOIPurchaseDate.Text != "")
            {
                xOIPurchaseDate = "'" + Convert.ToDateTime(txtOIPurchaseDate.Text).ToString("yyyy-MM-dd") + "'";
            }


            xStr = " Insert into fp_Investments(ClientCode,ProductName, InvestmentType, PurchasePrice, CurrentValue, StartDate, EntryDate ) " +
                " values(" + txtSessionUserID.Value + ",'Other', '" + txtOIInvType.Text + "', '" + txtOIPurchasePrice.Text + "', " +
                " '" + txtOICurrentValue.Text + "',  " + xOIPurchaseDate + ", " +
                " '" + Convert.ToDateTime(System.DateTime.Now).ToString("yyyy-MM-dd") + "' " +
                " ) ";
            cmd = new SqlCommand(xStr, Con);
            Con.Open();
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridOtherIncome();

            txtFIInvAmount.Text = "";
            txtFICurrentValue.Text = "";
            txtIssuingEntity.Text = "";
            txtROI.Text = "";
            txtFIRemarks.Value = "";

            btnOPaidPlanOutput.Visible = true;

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    void FillGridOtherIncome()
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            SqlDataAdapter GDA = new SqlDataAdapter(" " +

                    " select code, InvestmentType, PurchasePrice, CurrentValue, " +                    
                    " StartDate=convert(varchar(11),StartDate,113), MaturityDate=convert(varchar(11),MaturityDate,113) " +
                    " from fp_Investments r where ProductName='Other' and ClientCode=(select code from fp_Prospects where UserID='" + xCode + "')  " +
                    "  ", Con);

            DataSet GDS = new DataSet();
            Con.Open();
            GDA.Fill(GDS);
            Con.Close();

            GridViewOtherInv.DataSource = GDS;
            GridViewOtherInv.DataBind();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewOtherInv_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();

            GridViewRow row = (GridViewRow)GridViewFixedIncome.Rows[e.RowIndex];
            Con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM fp_Investments where Code='" + Convert.ToInt32(GridViewFixedIncome.DataKeys[e.RowIndex].Value.ToString()) + "'", Con);
            cmd.ExecuteNonQuery();
            Con.Close();
            FillGridOtherIncome();
        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
    protected void GridViewOtherInv_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridViewOtherInv.EditIndex = e.NewEditIndex;
        FillGridOtherIncome();
    }
    protected void GridViewOtherInv_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int code = Convert.ToInt32(GridViewOtherInv.DataKeys[e.RowIndex].Value.ToString());
        GridViewRow row = (GridViewRow)GridViewOtherInv.Rows[e.RowIndex];

        TextBox xOIInvType = (TextBox)row.Cells[1].Controls[0];
        TextBox xOIPurPrice = (TextBox)row.Cells[2].Controls[0];
        TextBox xOICurrentVal = (TextBox)row.Cells[3].Controls[0];                

        GridViewOtherInv.EditIndex = -1;
        Con.Open();

        SqlCommand cmd = new SqlCommand("update fp_Investments set InvestmentType='" + xOIInvType.Text + "', CurrentValue=" + xOICurrentVal.Text + ", " +
            " PurchasePrice='" + xOIPurPrice.Text + "' " +
            " where code='" + code + "'", Con);
        cmd.ExecuteNonQuery();
        Con.Close();
        FillGridOtherIncome();

    }
    protected void GridViewOtherInv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridViewOtherInv.EditIndex = -1;
        FillGridOtherIncome();
    }

    protected void DDMFInvType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DDMFInvType.SelectedValue.ToString() == "Lumpsum")
        {
            lblMFInvEndDate.Visible = false;
            txtMFEndDate.Visible = false;           
        }

        if (DDMFInvType.SelectedValue.ToString() == "SIP")
        {
            lblMFInvEndDate.Visible = true;
            txtMFEndDate.Visible = true;
        }

    }
    protected void btnMFPaidPlanOutPut_Click(object sender, EventArgs e)
    {
        if ((string)Session["userSessionID"] != null)
        {
            string xCode = Session["userSessionID"].ToString();
            SqlDataAdapter DA = new SqlDataAdapter(" " +
                            " select Risk=isnull(RiskCode,99) from fp_Prospects " +
                            " where userid='" + xCode + "'  " +
                            "  ", Con);

            DataSet DS = new DataSet();
            Con.Open();
            DA.Fill(DS);
            Con.Close();
            string xRisk = "";
            if (DS.Tables[0].Rows.Count > 0)
            {
                xRisk = DS.Tables[0].Rows[0]["Risk"].ToString();
            }

            if (xRisk == "99")
            {
                Response.Redirect("RiskSelected.aspx");
            }
            else
            { Response.Redirect("PaidPlanOutput.aspx"); }

        }
        else
        {
            Response.Redirect("SessionExpired.aspx");
        }
    }
}