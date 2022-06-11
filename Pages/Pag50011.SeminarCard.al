page 50011 SeminarCard
{
    Caption = 'SeminarCard';
    PageType = Card;
    SourceTable = Seminar;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec."Code")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = All;
                }
                field("Seminar Duration"; Rec."Seminar Duration")
                {
                    ApplicationArea = All;
                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                }
                field("Minimum Participants"; Rec."Minimum Participants")
                {
                    ApplicationArea = All;
                }
                field("Maximum Participants"; Rec."Maximum Participants")
                {
                    ApplicationArea = All;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = All;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
