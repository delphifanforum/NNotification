unit NNotification;

interface

type
  TNNotification = class
  private
    FApiKey: string;
    FAppId: string;
  public
    constructor Create(const ApiKey, AppId: string);
    procedure SendNotification(const Title, Message: string);
  end;

implementation

uses
  IdHTTP, IdSSLOpenSSL, System.JSON, System.SysUtils;

{ TNNotification }

constructor TNNotification.Create(const ApiKey, AppId: string);
begin
  FApiKey := ApiKey;
  FAppId := AppId;
end;

procedure TNNotification.SendNotification(const Title, Message: string);
var
  HTTP: TIdHTTP;
  JSON: TJSONObject;
  Request: TStringStream;
begin
  HTTP := TIdHTTP.Create(nil);
  try
    HTTP.IOHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
    JSON := TJSONObject.Create;
    JSON.AddPair('app_id', FAppId);
    JSON.AddPair('headings', TJSONObject.Create(TJSONPair.Create('en', Title)));
    JSON.AddPair('contents', TJSONObject.Create(TJSONPair.Create('en', Message)));
    Request := TStringStream.Create(JSON.ToString, TEncoding.UTF8);
    try
      HTTP.Request.ContentType := 'application/json';
      HTTP.Request.CustomHeaders.AddValue('Authorization', 'Basic ' + FApiKey);
      HTTP.Post('https://onesignal.com/api/v1/notifications', Request);
    finally
      Request.Free;
    end;
  finally
    JSON.Free;
    HTTP.Free;
  end;
end;

end.
