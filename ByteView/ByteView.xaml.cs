using System;
using System.Globalization;
using System.Windows;
using System.Windows.Controls;

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
				UpdateText();
			}
		}

		private byte _max = 255;
		public byte Max
		{
			get { return _max; }
			set
			{
				_max = value;
			}
		}

		private bool _hex = true;
		public bool Hex
		{
			get { return _hex; }
			set
			{
				_hex = value;
				textBlockHex.Visibility = Hex ? Visibility.Visible : Visibility.Collapsed;
				UpdateText();
			}
		}

		public ByteView() : this(0) { }
		public ByteView(byte value)
		{
			InitializeComponent();
			Value = value;
			UpdateText();
		}

		private bool TextChangeInternal = false;
		private void UpdateText()
		{
			TextChangeInternal = true;

			int start = textBoxValue.SelectionStart;
			textBoxValue.Text = Value.ToString(Hex ? "X" : "");
			textBoxValue.SelectionStart = start;

			TextChangeInternal = false;
		}

		private void textBoxValue_TextChanged(object sender, TextChangedEventArgs e)
		{
			if (TextChangeInternal)
				return;

			byte res;

			if (byte.TryParse("0" + textBoxValue.Text, Hex ? NumberStyles.HexNumber : NumberStyles.Number, null, out res))
			{
				if (res <= Max)
					Value = res;
			}

			UpdateText();

			Console.WriteLine(Value);
		}
	}
}
