using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security;
using System.Security.Cryptography;
using System.Text;
using System.Threading;
using System.Web;

/// <summary>
/// TripleDES 的摘要描述
/// </summary>
public class TripleDES
{
    //private static Byte[] key = { 3, 28, 198, 18, 16, 220, 17, 38, 67, 84, 151, 130, 156, 83, 198, 187, 28, 218, 136, 30, 205, 45, 3, 57 };//2, 3, 4, 5, 6, 7, 0, 9, 10, 11, 12, 13, 14, 15, 255, 17, 18, 19, 20, 21, 22, 23, 24, 25 };
    //private static Byte[] iv = { 113, 187, 29, 138, 119, 232, 215, 109 };

    //sent to 1111 也適用這個加解密
    private static Byte[] key = { 2, 3, 4, 5, 6, 7, 0, 9, 10, 11, 12, 13, 14, 15, 255, 17, 18, 19, 20, 21, 22, 23, 24, 25 };
    private static Byte[] iv = { 66, 111, 69, 27, 70, 179, 201, 220 };

    public static string Encrypt(string plainText)
    {
        if (!string.IsNullOrWhiteSpace(plainText))
        {
            UTF8Encoding utf8encoder = new UTF8Encoding();
            Byte[] inputInBytes = utf8encoder.GetBytes(plainText);

            TripleDESCryptoServiceProvider tdesProvider = new TripleDESCryptoServiceProvider();
            ICryptoTransform cryptoTransform = tdesProvider.CreateEncryptor(key, iv);

            MemoryStream encryptedStream = new MemoryStream();
            CryptoStream cryptStream = new CryptoStream(encryptedStream, cryptoTransform, CryptoStreamMode.Write);

            cryptStream.Write(inputInBytes, 0, inputInBytes.Length);
            cryptStream.FlushFinalBlock();
            encryptedStream.Position = 0;

            Byte[] result = new Byte[encryptedStream.Length];
            encryptedStream.Read(result, 0, int.Parse(encryptedStream.Length.ToString()));
            cryptStream.Close();
            return Convert.ToBase64String(result);
        }
        else
            return "";
    }

    public static string Encrypt(string plainText, byte[] _key, byte[] _iv)
    {

        if (!string.IsNullOrWhiteSpace(plainText))
        {
            UTF8Encoding utf8encoder = new UTF8Encoding();
            Byte[] inputInBytes = utf8encoder.GetBytes(plainText);

            TripleDESCryptoServiceProvider tdesProvider = new TripleDESCryptoServiceProvider();
            tdesProvider.Key = _key;
            //_cryptoAlgo.GenerateIV();
            tdesProvider.IV = _iv;
            tdesProvider.Mode = CipherMode.ECB;
            tdesProvider.Padding = PaddingMode.PKCS7;

            ICryptoTransform cryptoTransform = tdesProvider.CreateEncryptor();//(key, iv);

            MemoryStream encryptedStream = new MemoryStream();
            CryptoStream cryptStream = new CryptoStream(encryptedStream, cryptoTransform, CryptoStreamMode.Write);

            cryptStream.Write(inputInBytes, 0, inputInBytes.Length);
            cryptStream.FlushFinalBlock();
            encryptedStream.Position = 0;

            Byte[] result = new Byte[encryptedStream.Length];
            encryptedStream.Read(result, 0, int.Parse(encryptedStream.Length.ToString()));
            cryptStream.Close();
            return Convert.ToBase64String(result);
        }
        else
            return "";
    }

    public static string Decrypt(string inputString)
    {
        if (!string.IsNullOrWhiteSpace(inputString))
        {
            UTF8Encoding utf8encoder = new UTF8Encoding();
            TripleDESCryptoServiceProvider tdesProvider = new TripleDESCryptoServiceProvider();

            Byte[] inputInBytes = null;
            try
            {
                inputInBytes = Convert.FromBase64String(inputString);
            }
            catch
            {
            }

            ICryptoTransform cryptoTransform = tdesProvider.CreateDecryptor(key, iv);

            MemoryStream decryptedStream = new MemoryStream();
            CryptoStream cryptStream = new CryptoStream(decryptedStream, cryptoTransform, CryptoStreamMode.Write);

            if (inputInBytes != null)
                cryptStream.Write(inputInBytes, 0, inputInBytes.Length);
            cryptStream.FlushFinalBlock();
            decryptedStream.Position = 0;

            Byte[] result = new Byte[decryptedStream.Length];
            decryptedStream.Read(result, 0, int.Parse(decryptedStream.Length.ToString()));
            cryptStream.Close();

            UTF8Encoding myutf = new UTF8Encoding();
            return myutf.GetString(result);
        }
        else
            return "";
    }

    public static string Decrypt(string inputString, byte[] _key, byte[] _iv)
    {
        if (!string.IsNullOrWhiteSpace(inputString))
        {
            UTF8Encoding utf8encoder = new UTF8Encoding();
            TripleDESCryptoServiceProvider tdesProvider = new TripleDESCryptoServiceProvider();
            tdesProvider.Key = _key;
            //_cryptoAlgo.GenerateIV();
            tdesProvider.IV = _iv;
            tdesProvider.Mode = CipherMode.ECB;
            tdesProvider.Padding = PaddingMode.PKCS7;

            Byte[] inputInBytes = null;
            try
            {
                inputInBytes = Convert.FromBase64String(inputString);
            }
            catch
            {
            }

            ICryptoTransform cryptoTransform = tdesProvider.CreateDecryptor();//(key, iv);

            MemoryStream decryptedStream = new MemoryStream();
            CryptoStream cryptStream = new CryptoStream(decryptedStream, cryptoTransform, CryptoStreamMode.Write);

            if (inputInBytes != null)
                cryptStream.Write(inputInBytes, 0, inputInBytes.Length);
            cryptStream.FlushFinalBlock();
            decryptedStream.Position = 0;

            Byte[] result = new Byte[decryptedStream.Length];
            decryptedStream.Read(result, 0, int.Parse(decryptedStream.Length.ToString()));
            cryptStream.Close();

            UTF8Encoding myutf = new UTF8Encoding();
            return myutf.GetString(result);
        }
        else
            return "";
    }

}