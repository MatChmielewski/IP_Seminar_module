page 50020 InstructorList
{
    ApplicationArea = All;
    Caption = 'InstructorList';
    PageType = List;
    SourceTable = Instructor;
    UsageCategory = Lists;
    Editable = true;

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
                field("Worker/Subcontractor"; Rec."Worker/Subcontractor")
                {
                    ApplicationArea = All;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
