#Turns off Screen on Windows machines, leaving all programs running (eg. music is still playing)

$sleep = Add-Type -name "Win32" -MemberDefinition @'
        [DllImport("user32.dll")]
        public static extern int SendMessage(int hWnd, uint Msg, int wParam, int lParam);
'@ -namespace Win32 -passThru

$sleep::SendMessage(0xffff, 0x0112, 0xF170, 2)
