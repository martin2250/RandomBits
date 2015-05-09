private Color GetHeatMapColor(float val, float min, float max)
{
	val -= min;
	val /= (max - min);

	float r = 0, g = 0, b = 0;

	if(val < 0.2)
	{
		b = 1;
		g = 5 * val;
	}
	else if(val < 0.4)
	{
		val -= 0.2F;

		g = 1;
		b = 1 - 5 * val;
	}
	else if(val < 0.6)
	{
		val -= 0.4F;

		g = 1;
		r = 5 * val;
	}
	else if (val < 0.8)
	{
		val -= 0.6F;

		r = 1;
		g = 1 - 5 * val;
	}
	else
	{
		val -= 0.8F;

		r = 1;
		b = 5 * val;
	}

	return Color.FromArgb(255, (int)(r * 255), (int)(g * 255), (int)(b * 255));
}
