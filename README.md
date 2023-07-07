# NNotification
OneSignal NNotification Library in Delphi
```
To use this library, follow these steps:

Create a new Delphi unit called "NNotification.pas" and paste the code provided above into it.
Add the IdHTTP, IdSSLOpenSSL, System.JSON, and System.SysUtils units to your project's uses clause.
Create an instance of TNNotification with your OneSignal API key and app ID.
Call the SendNotification method, providing the title and message for the notification.
Here's an example usage:
```
>uses
  NNotification;

procedure TForm1.Button1Click(Sender: TObject);
var
  Notifier: TNNotification;
begin
  Notifier := TNNotification.Create('YOUR_API_KEY', 'YOUR_APP_ID');
  try
    Notifier.SendNotification('New Message', 'You have a new message!');
  finally
    Notifier.Free;
  end;
end;

