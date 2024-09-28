CAMERA_VIEWFINDER_DIR := files/graphic/camera_viewfinder
CAMERA_VIEWFINDER_NARC := $(CAMERA_VIEWFINDER_DIR).narc
CAMERA_VIEWFINDER_SRCS := \
	camera_viewfinder.NCLR \
	camera_viewfinder.NCGR.lz \
	camera_viewfinder.NSCR.lz
CAMERA_VIEWFINDER_SRCS_ABS := $(addprefix $(CAMERA_VIEWFINDER_DIR)/,$(CAMERA_VIEWFINDER_SRCS))

VERSION101_SOPC_NCGR_FILES += $(CAMERA_VIEWFINDER_DIR)/camera_viewfinder.NCGR

$(CAMERA_VIEWFINDER_NARC): %.narc: $(CAMERA_VIEWFINDER_SRCS_ABS)
	$(KNARC) -p $@ -d $* -i

clean-camera-viewfinder:
	$(RM) $(CAMERA_VIEWFINDER_NARC) \
	$(CAMERA_VIEWFINDER_SRCS_ABS) \
	$(CAMERA_VIEWFINDER_DIR)/camera_viewfinder.NCGR

.PHONY: clean-camera-viewfinder
clean-filesystem: clean-camera-viewfinder
