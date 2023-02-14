using System;

namespace ConstrustorsInstractor
{
    internal class ABCMethods
    {
        
           private float avgfeedback;
            private int experience;
            private string instructorname;
            private string[] instructorskill;

            public ABCMethods(string instructorname, float avgfeedback, int experience, string[] instructorskill)
            {
                this.instructorname = instructorname;
                this.avgfeedback = avgfeedback;
                this.experience = experience;
                this.instructorskill = instructorskill;
            }

            public bool validateligibility()
            {
                if (experience > 3 && avgfeedback == 4.5 || experience <= 3 && avgfeedback >= 4)
                {
                    return true;
                }
                return false;
            }

            public bool checkskill(string skill)
            {
                foreach (string iskill in instructorskill)
                {
                    if (iskill.Equals(skill))
                    {
                        return true;
                    }
                }
                return false;
            }


        
    }
}
