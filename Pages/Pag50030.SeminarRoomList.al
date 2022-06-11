page 50030 "Seminar Room List"
{
    ApplicationArea = All;
    Caption = 'Seminar Room List';
    PageType = List;
    SourceTable = "Seminar Room";
    UsageCategory = Lists;
    CardPageId = "Seminar Room";
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = All;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = All;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = All;
                }
                field("Fax No."; Rec."Fax No.")
                {
                    ApplicationArea = All;
                }
                field("Name 2"; Rec."Name 2")
                {
                    ApplicationArea = All;
                    Visible = false;
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
                field("Internal/External"; Rec."Internal/External")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
