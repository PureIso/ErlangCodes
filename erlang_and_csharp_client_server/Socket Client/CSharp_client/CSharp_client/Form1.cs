using System;
using System.Net.Sockets;
using System.Text;
using System.Threading;
using System.Windows.Forms;

namespace CSharp_client
{
    public partial class Form1 : Form
    {
        private Socket _clientSocket;

        public Form1()
        {
            InitializeComponent();
        }

        #region Thread Functions
        private void Connect(object stateInfo)
        {
            try
            {
                _clientSocket = new Socket(AddressFamily.InterNetwork, SocketType.Stream, ProtocolType.IP);
                System.Net.IPAddress ipAddress = System.Net.IPAddress.Parse("192.168.1.10");
                System.Net.IPEndPoint remoteEndPoint = new System.Net.IPEndPoint(ipAddress, 9000);
                _clientSocket.Connect(remoteEndPoint);
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
                EnableControl(connectButton, true);
            }
        }

        private void Send(object stateInfo)
        {
            try
            {
                //Send Data
                string data = GetTextBoxText(sendMessageTextBox);
                byte[] dataByte = System.Text.Encoding.ASCII.GetBytes(data);
                _clientSocket.Send(dataByte);

                //Receive reply
                byte[] buffer = new byte[1024];
                int dataReceived = _clientSocket.Receive(buffer);
                char[] chars = new char[dataReceived];

                Decoder decoder = System.Text.Encoding.UTF8.GetDecoder();
                decoder.GetChars(buffer, 0, dataReceived, chars, 0);

                string stringData = new string(chars);
                SetTextBoxText(returnMessageTextBox, stringData);

                if (data == "quit")
                {
                    EnableControl(connectButton, true);
                    _clientSocket.Close();
                }
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message);
            }
            finally
            {
                EnableControl(sendMessageButton,true);
            }
        }
        #endregion

        #region "Delegate Functions"
        private void EnableControl(Control control, bool enable)
        {
            if (control.InvokeRequired)
                control.Invoke((MethodInvoker)
                               delegate { EnableControl(control, enable); });
            else
                control.Enabled = enable;
        }
        private void SetTextBoxText(TextBox textbox, string text)
        {
            if (textbox.InvokeRequired)
                textbox.Invoke((MethodInvoker)
                               delegate { SetTextBoxText(textbox, text); });
            else
            {
                textbox.Clear();
                textbox.Text = text;
            }
        }
        private string GetTextBoxText(TextBox textbox)
        {
            string returnValue = null;
            if (textbox.InvokeRequired)
                textbox.Invoke((MethodInvoker)
                               delegate { returnValue = GetTextBoxText(textbox); });
            else
                return textbox.Text;
            return returnValue;
        }
        #endregion

        #region event handlers
        private void connectButton_Click(object sender, EventArgs e)
        {
            connectButton.Enabled = false;
            ThreadPool.QueueUserWorkItem(Connect);
        }

        private void sendMessageButton_Click(object sender, EventArgs e)
        {
            sendMessageButton.Enabled = false;
            ThreadPool.QueueUserWorkItem(Send);
        }
        #endregion
    }
}
