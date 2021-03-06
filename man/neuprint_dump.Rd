% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/dump.R
\name{neuprint_dump}
\alias{neuprint_dump}
\title{Download data from neuprint for specified bodyids / a specified ROI}
\usage{
neuprint_dump(dir, bodyids = NULL, roi = NULL, preprocess = NULL,
  connectivity = TRUE, volumes = TRUE, meta = TRUE, nat = TRUE,
  drvid = TRUE, flow.centrality = FALSE, soma = TRUE,
  estimate.soma = FALSE, heal = TRUE, connectors = TRUE,
  all_segments = TRUE, resample = FALSE, scale = 4,
  voxel.thresh = 1e+07, split = c("postsynapses", "presynapses",
  "distance"), dataset = NULL, conn = NULL, OmitFailures = TRUE, ...)
}
\arguments{
\item{dir}{the directory to which to save the dump}

\item{bodyids}{the body IDs for neurons/segments (bodies) you wish to query}

\item{roi}{a single ROI. Use \code{neuprint_ROIs} to see what is available.}

\item{preprocess}{a function that can be applied to a nat::neuronlist object, to be called on neurons once they are read from
the neuprint server using \code{neuprint_read_neurons}}

\item{connectivity}{whether or not to include connectivity information in the dump, i.e. an adjacency matrix between bodyids}

\item{volumes}{whether or not to include neuron volume information in the dump, i.e. voxels. Currently only  works by talking to a DVID server using
the package drvid}

\item{meta}{whether or not to fetch a meta data for the given bodyids, using \code{neuprint_get_meta}}

\item{nat}{whether or not to read neurons are \code{nat::neuronlist} objects (TRUE) or get SWC data frame (FALSE)}

\item{drvid}{whether or not to use \code{drvid::read.neuron.dvid} rather than a cypher post request to \code{neuprint_fetch_custom}, in order to read a neuron.
This might be faster, and this might also enable access to skeletons on an underlying DVID database that have not yet been ported to neuprint.}

\item{flow.centrality}{if TRUE, the neuron is split into primary neurite, axon and dendrite based on its flow centrality, as specified by  Schneider-Mizell et al. (2016),
using \code{catnat::flow.centrality}}

\item{soma}{whether or not to fetch a possible soma location for the given bodyids, using \code{neuprint_locate_soma}}

\item{estimate.soma}{if soma = TRUE, and estimate.soma = TRUE, then when a soma has not been tagged in rhe dataset, one is estimated by finding the leaf node with the largest mean geodesic distance from all synapses}

\item{heal}{whether or not to heal a fragmented skeleton using a minimum spanning tree, via \code{heal_skeleton}}

\item{connectors}{whether or not to add synapse data to the retrieved skeletons in the format used by the \code{rcatmaid} package, for easy use with \code{rcatmaid} or \code{catnat} functions.
This can be done for synapse-less skeletons using \code{neuprint_assign_connectors}}

\item{all_segments}{if TRUE, all bodies are considered, if FALSE, only 'Neurons', i.e. bodies with a status roughly traced status.}

\item{resample}{if a number, the neuron is resampled using \code{nat::resample}, stepsize = resample. If 0 or FALSE (default), no resampling occurs.}

\item{scale}{Resolution of sparse volume starting with 0 where each level
beyond 0 has 1/2 resolution of previous level. "coarse" will return the
volume in block coordinates.}

\item{voxel.thresh}{the size threshold, in number of voxels, a neuron/segment must exceed, to be included in the dump, if read from an ROI}

\item{split}{the algorithm will assign two main neurite compartments, which as per SWC format will be indicates as either axon (Label =2)
or dendrite (Label = 3) in the returned objects, at neuron$d$Label.
This assignment can be based which compartment contains the most postsynapses ("postsynapses") or presynapses ("presynapses"),
or the Euclidean distance of its first branch point from the primary branch point (i.e. the first branch point from the soma) ("distance").}

\item{dataset}{optional, a dataset you want to query. If NULL, the default specified by your R environ file is used. See \code{neuprint_login} for details.}

\item{conn}{optional, a neuprintr connection object, which also specifies the neuPrint server see \code{?neuprint_login}.
If NULL, your defaults set in your R.profile or R.environ are used.}

\item{OmitFailures}{Whether to omit neurons for which \code{FUN} gives an
error. The default value (\code{NA}) will result in nlapply stopping with
an error message the moment there is an error. For other values, see
details.}

\item{...}{methods passed to \code{neuprint_login}}
}
\description{
Download neuron morphology and connectivity data to a specified directory as .csv and .rda files
}
\seealso{
\code{\link{neuprint_get_synapses}}, \code{\link{neuprint_read_neurons}}
}
