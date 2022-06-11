report 50011 "Seminar List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Seminar List';
    RDLCLayout = 'Layout\SeminarList.rdl';

    dataset
    {
        dataitem("Seminar Registration Header"; "Seminar Registration Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "Starting Date", "Seminar Code", Status;
            DataItemTableView = sorting("No.");
            CalcFields = "Instructor Name";
            RequestFilterHeading = 'Seminar Registration Header';

            column(No_Seminar; "No.")
            {
                IncludeCaption = true;
            }
            column(StartingDate; "Starting Date")
            {
                IncludeCaption = true;
            }
            column(SeminarCode; "Seminar Code")
            {
                IncludeCaption = true;
            }
            column(SeminarName; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(Amount; Amount)
            {
                IncludeCaption = true;
            }
            column(CompanyName; CompanyName())
            {

            }

            dataitem("Seminar Registration Line"; "Seminar Registration Line")
            {
                CalcFields = "Participant Name";
                DataItemLink = "Seminar Registration No." = field("No.");
                DataItemTableView = sorting("Seminar Registration No.");

                column(ParticipantName;
                "Participant Name")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(To_Invoice; "To Invoice")
                {
                    IncludeCaption = true;
                }
                column(Participated; Participated)
                {
                    IncludeCaption = true;
                }
                column(Seminar_Price; "Seminar Price")
                {
                    IncludeCaption = true;
                }
                column(Line_Discount; "Line Discount %")
                {
                    IncludeCaption = true;
                }
                column(Amount_Line; Amount)
                {
                    IncludeCaption = true;
                }
                column(ShowDetails; ShowDetails)
                {

                }

            }
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                field("Show details"; ShowDetails)
                {
                    ApplicationArea = All;
                    Caption = 'Show Details';
                }
            }
        }
    }

    labels
    {
        TitleLbl = 'Seminar List';
        PageLbl = 'Page';
        TotalLbl = 'Amount';
    }

    var
        ShowDetails: boolean;

}