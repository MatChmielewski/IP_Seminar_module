Table 50020 "Instructor"
{
    fields
    {
        field(1; "Code"; Code[20])
        {
            Caption = 'Code';
        }
        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
        field(3; "Worker/Subcontractor"; Option)
        {
            Caption = 'Worker/Subcontractor';
            OptionMembers = Worker,Subcontractor;
            OptionCaption = 'Worker,Subontractor';

            trigger OnValidate()
            begin
                if "Worker/Subcontractor" <> xRec."Worker/Subcontractor" then begin
                    Name := '';
                    "Resource No." := '';
                    "Vendor No." := '';
                end;
            end;
        }
        field(4; "Resource No."; Code[20])
        {
            Caption = 'Resource No.';
            TableRelation = "Resource" where(Type = const(Person));

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                if Resource.Get("Resource No.") then
                    if "Worker/Subcontractor" = "Worker/Subcontractor"::Worker then
                        Name := Resource.Name
            end;
        }
        field(5; "Vendor No."; Code[20])
        {
            Caption = 'Vendor No.';
            TableRelation = "Vendor";

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                if Resource.Get("Vendor No.") then
                    if "Worker/Subcontractor" = "Worker/Subcontractor"::Subcontractor then
                        Name := Resource.Name
            end;
        }
    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }
}
