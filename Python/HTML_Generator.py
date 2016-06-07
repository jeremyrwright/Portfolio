import webbrowser, os.path
from tkinter import *
from tkinter import ttk
from tkinter import messagebox


class Generator:

    def __init__(self, master):

        master.title("HTML Generator")
        master.resizable(False, False)
        master.configure(background = 'grey')

        self.style = ttk.Style()
        self.style.configure('TFrame', background = 'grey')
        self.style.configure('TButton', background = 'grey')
        self.style.configure('TLabel', background = 'grey', font = ('verdana', 12))
        self.style.configure('Header.TLabel', font = ('verdana', 16, 'bold'))

        self.frame_header = ttk.Frame(master)
        self.frame_header.pack()

        ttk.Label(self.frame_header, text = 'Lets generate some HTML', style = 'Header.TLabel').grid(row = 0, column = 1, padx = 20)
        ttk.Label(self.frame_header, wraplength = 300,
                  text = ("Punch in some HTML and let er rip!")).grid(row = 4 , column = 1)

        self.frame_content = ttk.Frame(master)
        self.frame_content.pack()

        ttk.Label(self.frame_content, text = 'HTML:').grid(row = 0, column = 0, padx = 7, sticky = 'sw')

        self.html = Text(self.frame_content, width = 55, height = 15, padx = 5, font = ('verdana', 12))
        self.html.insert(1.0, HTML_content)
        self.html.pack()

        self.html.grid(row = 1, column = 0, columnspan = 2)

        ttk.Button(self.frame_content, text = 'Generate', command = self.doit).grid(row = 6, column = 0, padx = 20, sticky = 'sw')
        ttk.Button(self.frame_content, text = 'Clear', command = self.clear).grid(row = 6, column = 0, sticky = 'se')

    def doit(self):
        browser(self.html.get(1.0, 'end'))
        # browser(contents)

    def clear(self):
        self.html.delete(1.0, 'end')

HTML_content = '''
<!DOCTYPE html>
<html lang= "en">
<head>
<meta charset= "utf-8">
<title>Sweet Sale</title>
</head>

<body>
Stay tuned for our amazing summer sale!
</body>

</html>
'''

def strToFile(text, filename):
    # Write a file with the given name and text.
    output = open(filename,"w")
    output.write(text)
    output.close()

def browser(webpageText, filename='temp.html'):
    strToFile(webpageText, filename)
    webbrowser.open("file:///" + os.path.abspath(filename))
    messagebox.showinfo(title = "HTML Generator", message = "BOOM, You made a webpage!")

def main():
    root = Tk()
    style = ttk.Style() # Allows the background color to work on Mac
    style.theme_use('classic')
    generate = Generator(root)
    root.mainloop()

if __name__ == "__main__": main()
