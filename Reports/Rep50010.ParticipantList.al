report 50010 "Seminar Participant List"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Seminar Participant List';
    RDLCLayout = 'Layout\SeminarParticipantList.rdl';

    dataset
    {
        dataitem("Seminar Registration Header"; "Seminar Registration Header")
        {
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            RequestFilterHeading = 'Seminar Registration Header';
            DataItemTableView = sorting("No.");
            CalcFields = "Instructor Name";
            column(No_SeminarRegistrationHeader; "No.")
            {
                IncludeCaption = true;
            }
            column(SeminarCode_SeminarRegistrationHeader; "Seminar Code")
            {
                IncludeCaption = true;
            }
            column(SeminarName_SeminarRegistrationHeader; "Seminar Name")
            {
                IncludeCaption = true;
            }
            column(SeminarDuration_SeminarRegistrationHeader; "Seminar Duration")
            {
                IncludeCaption = true;
            }
            column(InstructorName_SeminarRegistrationHeader; "Instructor Name")
            {
                IncludeCaption = true;
            }
            column(SeminarRoomName_SeminarRegistrationHeader; "Seminar Room Name")
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

                column(BilltoCustomerNo_SeminarRegistrationLine; "Bill-to Customer No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantContactNo_SeminarRegistrationLine; "Participant Contact No.")
                {
                    IncludeCaption = true;
                }
                column(ParticipantName_SeminarRegistrationLine; "Participant Name")
                {
                    IncludeCaption = true;
                }
            }
        }
    }

    labels
    {
        TitleLbl = 'Seminar Participants List';
        PageLbl = 'Page';
        ParticipantsPerRegistrationLbl = 'Participants per registration';
        TotalLbl = 'Total participants';
    }
}