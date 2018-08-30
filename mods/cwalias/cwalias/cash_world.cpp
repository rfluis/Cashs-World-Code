#include <string>
#include <algorithm>
#include <fstream>
#include <vector>
#include <map>

void readfiles(std::vector<std::string>& lines,const std::vector<std::string>& infiles){
  std::string line;
  for (std::vector<std::string>::const_iterator itr=infiles.begin();itr!=infiles.end();itr++){
    std::ifstream infile(*itr,std::ifstream::in|std::ifstream::binary);
    while (std::getline(infile, line)) lines.push_back(line);
    }
  return;
}

void savefile(const std::string& path,const std::vector<std::string>& buffer){
  std::ofstream out(path,std::ofstream::out|std::ofstream::binary);
  for (std::vector<std::string>::const_iterator itr=buffer.begin();itr!=buffer.end();itr++)
    out << *itr << std::endl;
  return;
}

void extract_quoted(std::vector<std::string>& quoted,const std::vector<std::string>& lines)
{
  bool quotes=false;
  std::string found;
  
  for (std::vector<std::string>::const_iterator itr=lines.begin();itr!=lines.end();itr++){
    const std::string& line = *itr;
    for (std::string::const_iterator ptr=line.begin();ptr!=line.end();ptr++){
      if (quotes && *ptr!='\"') found.push_back(*ptr);
      if (quotes && *ptr=='\"') quoted.push_back(found);
      if (!quotes &&  *ptr=='\"') found.clear();
      if (*ptr=='\"') quotes = !quotes; 
      }
    }
  return;
}

void extract_colon(std::vector<std::string>& colon,const std::vector<std::string>& lines)
{
  for (std::vector<std::string>::const_iterator itr=lines.begin();itr!=lines.end();itr++)
    if (itr->find(':') != std::string::npos)
      colon.push_back(*itr);
  return;
}

int main(int argc,char** argv)
{
  std::vector<std::string> infiles(argv+1,argv+argc),lines,quoted,colon;
  std::map<std::string,bool> nodes;
  readfiles(lines,infiles);
  extract_quoted(quoted,lines);
  extract_colon(colon,quoted);
  
  savefile("out_infiles.txt",infiles);
  savefile("out_lines.txt",lines);
  savefile("out_quoted.txt",quoted);
  savefile("out_colon.txt",colon);
  
  return 0;
  
}
