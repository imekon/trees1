unit main;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, raylib, utils;

type

  { TGame }

  TGame = class
  private
    m_camera: TCamera;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Update;
    procedure Draw3D;
    procedure Draw2D;
    procedure DrawTree(x, z: double);
  end;

implementation

{ TGame }

constructor TGame.Create;
begin
  m_camera.position := Vec3(0, 2, 4);
  m_camera.target := Vec3(0, 2, 0);
  m_camera.up := Vec3(0, 1, 0);
  m_camera.fovy := 60;
  m_camera.projection := CAMERA_PERSPECTIVE;

  DisableCursor;
end;

destructor TGame.Destroy;
begin
  inherited Destroy;
end;

procedure TGame.Update;
begin
  UpdateCamera(@m_camera, CAMERA_THIRD_PERSON);
end;

procedure TGame.Draw3D;
var
  x, y: integer;

begin
  BeginMode3D(m_camera);
    DrawPlane(Vec3(0, 0, 0), Vec2(100, 100), YELLOW);
    for y := 0 to 7 do
      for x := 0 to 7 do
        DrawTree(x * 8 - 32, y * 8 - 32);
  EndMode3D;
end;

procedure TGame.Draw2D;
begin
  DrawFPS(10, 10);
end;

procedure TGame.DrawTree(x, z: double);
begin
  DrawCube(Vec3(x, 2.5, z), 0.4, 4, 0.4, BROWN);
  DrawCube(Vec3(x, 4, z), 3, 2, 3, GREEN);
end;

end.

