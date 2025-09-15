# OceanParcels + Copernicus Marine: Sample Jupyter Notebooks

This repository provides example Jupyter notebooks for running the [**OceanParcels**](https://oceanparcels.org/) Lagrangian particle tracking framework using Copernicus Marine Service (CMEMS) data, and for visualizing simulation results such as particle trajectories.

## Repository structure
- cmems_request.sh (Download CMEMS ocean currents / stokes drift data; Mediterranean Sea Physics and Wave reanalysis products)
- run_parcels.ipynb (Run OceanParcels simulations)
- visualize_traj.ipynb (Plot trajectories)

## Dependencies

- Python 3.9+ (recommended via conda)
- [Parcels](https://oceanparcels.org/)
- [copernicusmarine toolbox](https://help.marine.copernicus.eu/en/articles/7949409-copernicus-marine-toolbox-introduction)
- jupyter notebook
- xarray
- numpy
- cartopy
- zarr
- netcdf4 
- pandas

## References

- [OceanParcels Documentation](https://oceanparcels.org/)
- [Copernicus Marine Service](https://marine.copernicus.eu/)
