% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/neurons.R, R/soma.R
\name{neuprint_assign_connectors}
\alias{neuprint_assign_connectors}
\alias{neuprint_locate_soma}
\title{Assign synapses to a neuronal tree}
\usage{
neuprint_assign_connectors(x, bodyids = NULL, dataset = NULL,
  conn = NULL, ...)

neuprint_locate_soma(bodyids, dataset = NULL, all_segments = TRUE,
  conn = NULL, ...)
}
\arguments{
\item{x}{either an object of class neuron, or neuronlist}

\item{bodyids}{the body IDs for neurons/segments (bodies) you wish to query}

\item{dataset}{optional, a dataset you want to query. If NULL, the default specified by your R environ file is used. See \code{neuprint_login} for details.}

\item{conn}{optional, a neuprintr connection object, which also specifies the neuPrint server see \code{?neuprint_login}.
If NULL, your defaults set in your R.profile or R.environ are used.}

\item{...}{methods passed to \code{neuprint_login}}

\item{all_segments}{if TRUE, all bodies are considered, if FALSE, only 'Neurons', i.e. bodies with a status roughly traced status.}
}
\value{
a neuron/neuronlist object as dictated used by the \code{nat} and \code{rcatmaid} packages

a data frame of X,Y,Z coordinates, a row for each bodyid supplied
}
\description{
Fetch the synapses associated with a bodyid and assign them to the nearest point in the skeleton. For this to work, the skeletons must be in the same brainspace as the synaptic data being pulled from neuprint. I.e. do not transform them to another brainspace, until after this step.

For some datasets, somata positions have been mapped to pixels within a soma volume in the image data. If your bodyids contain such an annotated pixel, you can retrieve its position.
}
\seealso{
\code{\link{neuprint_fetch_custom}}, \code{\link{neuprint_get_synapses}}, \code{\link{neuprint_read_neurons}}

\code{\link{neuprint_fetch_custom}}, \code{\link{neuprint_get_synapses}}, \code{\link{neuprint_read_neurons}}
}
