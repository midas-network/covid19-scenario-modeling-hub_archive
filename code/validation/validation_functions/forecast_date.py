import pandas as pd
import os


def filename_match_forecast_date(filepath):
    df = pd.read_csv(filepath)
    file_forecast_date = os.path.basename(os.path.basename(filepath))[:10]
    forecast_date_column = set(list(df['model_projection_date']))
    if len(forecast_date_column) > 1:
        return True, ["PROJECTION DATE ERROR: %s has multiple model projection dates: %s. Projection date must be unique" % (
            filepath, forecast_date_column)]
    else:
        forecast_date_column = forecast_date_column.pop()
        if (file_forecast_date != forecast_date_column):
            return True, ["PROJECTION DATE ERROR %s forecast filename date %s does match forecast_date column %s" % (
                filepath, file_forecast_date, forecast_date_column)]
        else:
            return False, "no errors"
