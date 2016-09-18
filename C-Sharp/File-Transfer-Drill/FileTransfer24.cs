using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FileTransfer
{
    class Program
    {
        public static void transfer()
        {
            string fileName = ".txt";

            string sourcePath = @"C:\Users\canow\Desktop\FolderA";
            string targetPath = @"C:\Users\canow\Desktop\FolderB";

            string sourceFile = System.IO.Path.Combine(sourcePath, fileName);
            string targetFile = System.IO.Path.Combine(targetPath, fileName);

            if (System.IO.Directory.Exists(targetPath))
            {
                System.IO.Directory.CreateDirectory(targetPath);
            }

            if (System.IO.Directory.Exists(sourcePath))
            {
                string[] files = System.IO.Directory.GetFiles(sourcePath);

                foreach (string s in files)
                {
                    DateTime fileDate = System.IO.File.GetCreationTime(s);
                    bool checkTime = fileDate > DateTime.Now.AddHours(-24);

                    if (checkTime == true)
                    {
                        fileName = System.IO.Path.GetFileName(s);
                        targetFile = System.IO.Path.Combine(targetPath, fileName);
                        System.IO.File.Copy(s, targetFile, true);

                        Console.WriteLine("***File Transferred***");
                    }
                }
                Console.WriteLine("\n FILE TRANSFER COMPLETE \n");
            }

            else
            {
                Console.WriteLine("Source path doesn't exist.");
            }

            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
            
        }
        static void Main(string[] args)
        {
            Program.transfer();
        }
    }
}
