page 50007 "Manager szkoleń"
{
    Caption = 'Manager szkoleń';
    PageType = RoleCenter;

    layout
    {
    }

    actions
    {
        area(Sections)
        {
            group(Lists)
            {
                Caption = 'Lists';
                action(Seminars)
                {
                    Caption = 'Seminars';
                    ApplicationArea = All;
                    RunObject = page Seminar;
                }

                action(Instructors)
                {
                    Caption = 'Instructors';
                    ApplicationArea = All;
                    RunObject = page InstructorList;
                }

                action("Seminar Rooms")
                {
                    Caption = 'Seminar Rooms';
                    ApplicationArea = All;
                    RunObject = page "Seminar Room List";
                }

                action("Seminar Registration")
                {
                    Caption = 'Seminar Registration';
                    ApplicationArea = All;
                    RunObject = page "Seminar Registration List";
                }
            }

            group(Tasks)
            {
                Caption = 'Tasks';

                action("Export seminar participants")
                {
                    Caption = 'Export seminar participants';
                    ApplicationArea = All;
                    RunObject = xmlport Seminar_Participant_List;
                }
            }

            group(Reports)
            {
                Caption = 'Reports';

                action("Seminar participants' list")
                {
                    Caption = 'Seminar participants` list';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar Participant List";
                }

                action("Seminar pool")
                {
                    Caption = 'Seminar pool';
                    ApplicationArea = All;
                    Image = Report;
                    RunObject = report "Seminar List";
                }
            }

        }
    }

}

profile "My Profile"
{
    Caption = 'My Profile';
    RoleCenter = "Manager szkoleń";
}
