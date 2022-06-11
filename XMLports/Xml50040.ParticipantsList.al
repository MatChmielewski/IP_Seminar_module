xmlport 50040 Seminar_Participant_List
{
    Direction = Export;
    Format = Xml;
    UseRequestPage = true;
    Caption = 'Export XML';

    schema
    {

        textelement(Seminar_Registration_Participant_List)
        {
            tableelement(Seminar; "Seminar Registration Header")
            {
                XmlName = 'Seminar';
                CalcFields = "Instructor Name";
                RequestFilterHeading = 'Seminar Registration Header';
                fieldelement(Registration_No; Seminar."No.") { }
                fieldelement(Seminar_Code; Seminar."Seminar Code") { }
                fieldelement(Semianr_Name; Seminar."Seminar Name") { }
                fieldelement(Starting_Date; Seminar."Starting Date") { }
                fieldelement(Seminar_Duration; Seminar."Seminar Duration") { }
                fieldelement(Instructor_Name; Seminar."Instructor Name") { }
                fieldelement(Room_Name; Seminar."Seminar Name") { }

                tableelement(Participant; "Seminar Registration Line")
                {
                    XmlName = 'Participant';
                    MinOccurs = Zero;
                    LinkTable = "Seminar";
                    LinkFields = "Seminar Registration No." = field("No.");
                    RequestFilterHeading = 'Seminar Registration Line';
                    fieldelement(Customer_No;
                    Participant."Bill-to Customer No.")
                    { }
                    textelement(Customer_Name)
                    {
                        trigger OnBeforePassVariable()
                        var
                            Customer: Record Customer;
                        begin
                            Customer.get(Participant."Bill-to Customer No.");
                            Customer_Name := Customer.Name;
                        end;
                    }
                    fieldelement(Constact_No; Participant."Participant Contact No.") { }
                    fieldelement(Participant_Name; Participant."Participant Name") { }
                }
            }


        }
    }

    requestpage
    {
        actions
        {
            area(processing)
            {
                action("Export Seminar Participants")
                {
                    Caption = 'Export Seminar Participants';
                    ApplicationArea = All;
                    Image = XMLFile;

                    trigger OnAction()
                    begin
                        Xmlport.Run(Xmlport::Seminar_Participant_List);
                    end;
                }
            }
        }
    }
}
