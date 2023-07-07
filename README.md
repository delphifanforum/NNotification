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
```
uses
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
```
```
Remember to replace 'YOUR_API_KEY' and 'YOUR_APP_ID' with your actual OneSignal API key and app ID.

This library provides a basic implementation for sending push notifications using the OneSignal service. 
You can further enhance it by adding additional parameters to the SendNotification method, such as icons, 
buttons, or targeting specific devices or user segments. Refer to the OneSignal API documentation for
more information on available options and parameters.
```
