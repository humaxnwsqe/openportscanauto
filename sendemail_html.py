import smtplib
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.base import MIMEBase
from email import encoders
import zipfile
import os



def zip(src_path, dest_file):
        with zipfile.ZipFile(dest_file, 'w') as zf:
                rootpath = src_path
                for (path, dir, files) in os.walk(src_path):
                        for file in files:
                                #if only file extension is html, include it to zip file
                                if file.endswith(".html"):
                                        print(file)
                                        fullpath = os.path.join(path, file)
                                        relpath = os.path.relpath(fullpath, rootpath);
                                        zf.write(fullpath, relpath, zipfile.ZIP_DEFLATED)
                zf.close()


'''
def unzip(source_file, dest_path):
    with zipfile.ZipFile(source_file, 'r') as zf:
        zf.extractall(path=dest_path)
        zf.close()
'''

# Information about email
# email_sender: 발송 email id
# email_sender_pw: 발송 email password
# receipients : email 수신인, abc@abc.com 형태로 입력, 여러 명 설정 가능 (list type)
email_sender = 'humaxnwsqe@gmail.com'
email_sender_pw = 'humax2015@!'      
email_recipients = ['hslee4@humaxdigital.com']         

# 제목 입력
subject = 'Port scan result using Nmap' 

msg = MIMEMultipart()
msg['From'] = email_user
msg['To'] = ", ".join(email_recipients)
msg['Subject'] = subject

# 본문 내용 입력
body = 'Please refer to the attached html page.'
msg.attach(MIMEText(body,'plain'))


############### ↓ 첨부파일이 없다면 삭제 가능  ↓ ########################
# 첨부파일 경로/이름 지정하기

#To get current path
cur_path = os.getcwd()

files = os.listdir(cur_path)

for filename in files:
        #if only file extension is html, include it to zip file
        if filename.endswith(".html"):
                print(filename)
                attachment = open(filename,'rb')
                part = MIMEBase('application','octet-stream')
                part.set_payload((attachment).read())
                encoders.encode_base64(part)
                part.add_header('Content-Disposition',"attachment; filename= "+filename)
                msg.attach(part)
############### ↑ 첨부파일이 없다면 삭제 가능  ↑ ########################

text = msg.as_string()
server = smtplib.SMTP('smtp.gmail.com',587)
server.ehlo()
server.starttls()
server.login(email_user,email_password)

server.sendmail(email_user,email_recipients,text)
server.quit()
