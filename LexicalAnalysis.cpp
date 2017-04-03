#include<iostream>
#include<string>
#include<vector>
using namespace std;

int main()
{
    string smt,temp;
    vector<string> lex;

    getline(cin,smt);


    for(int i = 0;i<smt.length();i++)
    {
        if(smt[i]>=65)
        {
            temp += smt[i];
        }
        else
        {
            if(smt[i]==' ' && temp.length()>0)
            {
                lex.push_back(temp);
                temp.clear();
            }
            else if(smt[i] == '+' || smt[i] == '-' || smt[i] == '*' || smt[i] == '/' || smt[i] == '%' ||smt[i] == '=')
            {
                if(temp.length() > 0)
                {
                    lex.push_back(temp);
                    temp.clear();
                }
                temp = smt[i];
                lex.push_back(temp);
                temp.clear();
            }
        }
    }

    if(temp.length() > 0)
        lex.push_back(temp);

    cout<<endl;
    for(int i = 0;i < lex.size(); i++)
        cout<<lex[i]<<endl;

    return 0;
}

