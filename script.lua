-- ===================================================
-- Roblox Ultimate Daily Key System (All-in-One)
-- ===================================================

local CurrentDay = os.date("%A") -- ดึงชื่อวันปัจจุบันของระบบ
local CorrectKey = ""

-- กำหนดคีย์ตามวันทั้ง 7 วัน
if CurrentDay == "Saturday" then
    CorrectKey = "rrtttt156"
elseif CurrentDay == "Sunday" then
    CorrectKey = "ryryry156"
elseif CurrentDay == "Monday" then
    CorrectKey = "gghhvv"
elseif CurrentDay == "Tuesday" then
    CorrectKey = "yyuuii"
elseif CurrentDay == "Wednesday" then
    CorrectKey = "kjkj910"
elseif CurrentDay == "Thursday" then
    CorrectKey = "supophon19"
elseif CurrentDay == "Friday" then
    CorrectKey = "kokop"
end

-- ตารางคีย์ทั้งหมดสำหรับให้กดปุ่มคัดลอกส่งให้เพื่อนดู
local AllKeysText = [[
🔑 ตารางคีย์สคริปต์ประจำวัน:
- วันจันทร์: gghhvv
- วันอังคาร: yyuuii
- วันพุธ: kjkj910
- วันพฤหัสบดี: supophon19
- วันศุกร์: kokop
- วันเสาร์: rrtttt156
- วันอาทิตย์: ryryry156
]]

-- สร้าง ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ProKeySystemUI"
ScreenGui.ResetOnSpawn = false

-- กำหนด Parent รองรับ Delta Executor
if gethui then
    ScreenGui.Parent = gethui()
elseif game:GetService("CoreGui"):FindFirstChild("RobloxGui") then
    ScreenGui.Parent = game:GetService("CoreGui")
else
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
end

-- ตัวกรอบหลัก (Main Frame)
local MainFrame = Instance.new("Frame")
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -105)
MainFrame.Size = UDim2.new(0, 300, 0, 210)
MainFrame.Active = true
MainFrame.Draggable = true

local FrameCorner = Instance.new("UICorner")
FrameCorner.CornerRadius = UDim.new(0, 10)
FrameCorner.Parent = MainFrame

-- หัวข้อ (Title)
local Title = Instance.new("TextLabel")
Title.Parent = MainFrame
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 0, 0, 10)
Title.Size = UDim2.new(1, 0, 0, 25)
Title.Font = Enum.Font.SourceSansBold
Title.Text = "🔑 ระบบคีย์ประจำวัน (Daily Key)"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.TextSize = 18

-- แสดงบอกวันปัจจุบัน
local DayLabel = Instance.new("TextLabel")
DayLabel.Parent = MainFrame
DayLabel.BackgroundTransparency = 1
DayLabel.Position = UDim2.new(0, 0, 0, 35)
DayLabel.Size = UDim2.new(1, 0, 0, 20)
DayLabel.Font = Enum.Font.SourceSans
DayLabel.Text = "📅 วันนี้วัน: " .. CurrentDay
DayLabel.TextColor3 = Color3.fromRGB(0, 255, 170)
DayLabel.TextSize = 14

-- ช่องกรอกคีย์ (TextBox)
local KeyBox = Instance.new("TextBox")
KeyBox.Parent = MainFrame
KeyBox.BackgroundColor3 = Color3.fromRGB(40, 40, 48)
KeyBox.Position = UDim2.new(0.1, 0, 0.32, 0)
KeyBox.Size = UDim2.new(0.8, 0, 0, 35)
KeyBox.Font = Enum.Font.SourceSans
KeyBox.PlaceholderText = "กรอกคีย์ของวันนี้ที่นี่..."
KeyBox.Text = ""
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.TextSize = 16

local BoxCorner = Instance.new("UICorner")
BoxCorner.CornerRadius = UDim.new(0, 6)
BoxCorner.Parent = KeyBox

-- ปุ่มยืนยันคีย์ (Submit Button)
local CheckBtn = Instance.new("TextButton")
CheckBtn.Parent = MainFrame
CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
CheckBtn.Position = UDim2.new(0.1, 0, 0.55, 0)
CheckBtn.Size = UDim2.new(0.8, 0, 0, 35)
CheckBtn.Font = Enum.Font.SourceSansBold
CheckBtn.Text = "เข้าใช้งาน (Submit)"
CheckBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CheckBtn.TextSize = 16

local BtnCorner1 = Instance.new("UICorner")
BtnCorner1.CornerRadius = UDim.new(0, 6)
BtnCorner1.Parent = CheckBtn

-- ปุ่มคัดลอกตารางคีย์ทั้งหมด 7 วัน
local CopyAllBtn = Instance.new("TextButton")
CopyAllBtn.Parent = MainFrame
CopyAllBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 70)
CopyAllBtn.Position = UDim2.new(0.1, 0, 0.77, 0)
CopyAllBtn.Size = UDim2.new(0.8, 0, 0, 32)
CopyAllBtn.Font = Enum.Font.SourceSansBold
CopyAllBtn.Text = "📋 คัดลอกตารางคีย์ทั้งหมด 7 วัน"
CopyAllBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyAllBtn.TextSize = 13

local BtnCorner2 = Instance.new("UICorner")
BtnCorner2.CornerRadius = UDim.new(0, 6)
BtnCorner2.Parent = CopyAllBtn

-- ===================================================
-- ฟังก์ชันการทำงาน
-- ===================================================

-- ปุ่มคัดลอกตารางคีย์
CopyAllBtn.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(AllKeysText)
        CopyAllBtn.Text = "✅ คัดลอกตารางคีย์แล้ว!"
        task.wait(2.5)
        CopyAllBtn.Text = "📋 คัดลอกตารางคีย์ทั้งหมด 7 วัน"
    else
        CopyAllBtn.Text = "❌ ไม่รองรับการคัดลอก"
    end
end)

-- ปุ่มเช็กคีย์
CheckBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == CorrectKey then
        CheckBtn.Text = "คีย์ถูกต้อง! กำลังโหลด..."
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 200, 100)
        task.wait(0.8)
        ScreenGui:Destroy()
        
        -- 🚀 รันสคริปต์หลักของคุณเก้าจาก GitHub
        loadstring(game:HttpGet("https://raw.githubusercontent.com/opyjfggyedet-spec/Rt/main/main.lua"))()
    else
        CheckBtn.Text = "คีย์ไม่ถูกต้อง!"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
        task.wait(1.2)
        CheckBtn.Text = "เข้าใช้งาน (Submit)"
        CheckBtn.BackgroundColor3 = Color3.fromRGB(0, 170, 100)
    end
end)
