FIELDDATA_MAPMATRIX_MAP_MATRIX_DIR := files/fielddata/mapmatrix/map_matrix

clean-map-matrix:
	$(RM) $(FIELDDATA_MAPMATRIX_MAP_MATRIX_DIR).narc

.PHONY: clean-map-matrix
clean-filesystem: clean-map-matrix
