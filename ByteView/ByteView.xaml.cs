using System;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace martin2250
{
	public partial class ByteView : UserControl
	{
		private byte _value;
		public byte Value
		{
			get { return _value; }
			set
			{
				_value = value;
				textBoxValue.Text = Convert.ToString(value, Hex ? 16 : 10);
			}
		}

		private bool _hex = true;
		public bool Hex
		{
			get { return _hex; }
			set
			{
				_hex = value;
				textBoxValue.Text = Convert.ToString(Value, value ? 16 : 10);
				textBlockHex.Visibility = value ? Visibility.Visible : Visibility.Collapsed;
			}
		}

		public byte Max { get; set; } = 255;

		public ByteView(byte value)
		{
			InitializeComponent();

			Value = value;
		}

		public ByteView():this(0)
		{

		}

		private void textBoxValue_PreviewTextInput(object sender, TextCompositionEventArgs e)
		{
			string text = ((TextBox)sender).Text + e.Text;

			byte val;

			if (!byte.TryParse(text, NumberStyles.HexNumber, null, out val))
			{
				e.Handled = true;
				return;
			}

			if (val > Max)
				e.Handled = true;
			else
				_value = val;
		}
	}
}
