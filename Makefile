MODULE_big = pg_logger
OBJS = pg_logger.o

EXTENSION = pg_logger
DATA = pg_logger--1.0.sql
PGFILEDESC = "pg_logger - send log messages via libcurl"

REGRESS_OPTS = --temp-config $(top_srcdir)/contrib/pg_logger/pg_logger.conf
REGRESS = pg_logger

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/pg_logger
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif

LDFLAGS += -lcurl
