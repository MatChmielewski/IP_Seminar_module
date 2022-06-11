Table 50050 "Seminar Registration Line"
{

    Permissions = tabledata "Seminar Registration Header" = r;

    fields
    {
        field(1; "Seminar Registration No."; Code[20])
        {
            Caption = 'Seminar Registration No.';
            TableRelation = "Seminar Registration Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(3; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = "Customer";

            trigger OnValidate()
            begin
                if Registered <> false then
                    Error(BillErr);
            end;
        }
        field(4; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = "Contact";

            trigger OnLookup()
            var
                ContactBR: Record "Contact Business Relation";
                Contact: Record Contact;
            begin
                ContactBR.Reset();
                ContactBR.SetRange("Link to Table", ContactBR."Link to Table"::Customer);
                ContactBR.SetRange("No.", "Bill-to Customer No.");
                if ContactBR.FindFirst() then begin
                    Contact.SetRange("Company No.", ContactBR."Contact No.");
                    if PAGE.RunModal(5052, Contact) = Action::LookupOK then begin
                        "Participant Contact No." := Contact."No.";
                        CalcFields("Participant Name");
                    end;
                end;
            end;
        }
        field(5; "Participant Name"; Text[100])
        {
            Caption = 'Participant Name';
            FieldClass = FlowField;
            CalcFormula = lookup(Contact.Name where("No." = field("Participant Contact No.")));
        }
        field(6; "Register Date"; Date)
        {
            Caption = 'Register Date';
            Editable = false;
        }
        field(7; "To Invoice"; Boolean)
        {
            Caption = 'To Invoice';
            InitValue = false;
        }
        field(8; Participated; Boolean)
        {
            Caption = 'Participated';
        }
        field(9; "Confirmation Date"; Date)
        {
            Caption = 'Confirmation Date';
        }
        field(10; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 2;

            trigger OnValidate()
            var
                Header: Record "Seminar Registration Header";
                newAmount: Decimal;
            begin
                if Header.Get("Seminar Registration No.") then begin
                    "Seminar Price" := Header."Seminar Price";
                    newAmount := (100 - "Line Discount %") / 100 * "Seminar Price";
                    Validate(Amount, newAmount);
                end;
            end;
        }
        field(11; "Line Discount %"; Decimal)
        {
            Caption = 'Line Discount %';
            DecimalPlaces = 0 : 5;
            MinValue = 0;
            MaxValue = 100;

            trigger OnValidate()
            begin
                "Line Discount Amount" := "Seminar Price" * ("Line Discount %" / 100.0);
                Amount := "Seminar Price" - "Line Discount Amount";
            end;
        }
        field(12; "Line Discount Amount"; Decimal)
        {
            Caption = 'Line Discount Amount';
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                if "Line Discount Amount" > "Seminar Price" then
                    Error(DiscountExceedErr)
                else begin
                    Amount := "Seminar Price" - "Line Discount Amount";
                    "Line Discount %" := ("Line Discount Amount" / "Seminar Price") * 100.0;
                end;
            end;
        }
        field(13; Amount; Decimal)
        {
            Caption = 'Amount';
            AutoFormatType = 1;

            trigger OnValidate()
            begin
                if Amount > "Seminar Price" then
                    Error(AmountErr)
                else begin
                    "Line Discount Amount" := "Seminar Price" - Amount;
                    "Line Discount %" := ("Line Discount Amount" / "Seminar Price") * 100.0;
                end;
            end;
        }
        field(14; Registered; Boolean)
        {
            Caption = 'Registered';

            trigger OnValidate()
            begin
                if "Register Date" = 0D then
                    "Register Date" := WorkDate();
            end;
        }
        field(15; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            TableRelation = "Sales Header" where("Document Type" = const(Invoice));
            Editable = false;
        }
    }

    keys
    {
        key(Key1; "Seminar Registration No.", "Line No.")
        {
            Clustered = true;
            SumIndexFields = Amount;
        }
    }

    trigger OnModify()
    var
        RegistrationHeader: Record "Seminar Registration Header";
    begin
        if RegistrationHeader.Get("Seminar Registration No.") then begin
            Validate("Seminar Price", RegistrationHeader."Seminar Price");
            RegistrationHeader.CalcFields(RegistrationHeader.Amount);
        end;
    end;

    trigger OnInsert()
    var
        RegistrationHeader: Record "Seminar Registration Header";
    begin
        if RegistrationHeader.Get("Seminar Registration No.") then begin
            Validate("Seminar Price", RegistrationHeader."Seminar Price");
            Validate(Amount, "Seminar Price");
            RegistrationHeader.CalcFields(RegistrationHeader.Amount);
        end;
    end;

    trigger OnDelete()
    begin
        if Registered = true then
            Error(DeleteRegisteredErr);
    end;

    var
        updating: Boolean;
        DiscountExceedErr: label 'Insuficient Discount';
        AmountErr: label 'Invalid amount';
        DeleteRegisteredErr: label 'Cannot remove registered participant';
        BillErr: label 'Value cannot be changed. Already registered';
}
