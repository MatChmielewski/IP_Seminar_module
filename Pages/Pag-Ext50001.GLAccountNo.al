pageextension 50001 GLAccountNo extends "Sales & Receivables Setup"
{
    layout
    {
        addafter(Archiving)
        {
            group("Moduł szkoleń")
            {
                field("G/L Account No."; Rec."G/L Account No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
