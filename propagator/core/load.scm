;;; ----------------------------------------------------------------------
;;; Copyright 2009 Massachusetts Institute of Technology.
;;; ----------------------------------------------------------------------
;;; This file is part of Propagator Network Prototype.
;;; 
;;; Propagator Network Prototype is free software; you can
;;; redistribute it and/or modify it under the terms of the GNU
;;; General Public License as published by the Free Software
;;; Foundation, either version 3 of the License, or (at your option)
;;; any later version.
;;; 
;;; Propagator Network Prototype is distributed in the hope that it
;;; will be useful, but WITHOUT ANY WARRANTY; without even the implied
;;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
;;; See the GNU General Public License for more details.
;;; 
;;; You should have received a copy of the GNU General Public License
;;; along with Propagator Network Prototype.  If not, see
;;; <http://www.gnu.org/licenses/>.
;;; ----------------------------------------------------------------------

(define (self-relatively thunk)
  (let ((place (ignore-errors current-load-pathname)))
    (if (pathname? place)
	(with-working-directory-pathname
	 (directory-namestring place)
	 thunk)
	(thunk))))

(define (load-relative filename)
  (self-relatively (lambda () (load filename))))

(load-relative "../support/load")

(for-each load-relative-compiled
  '("scheduler"
    ;"metadata"
    "diagrams"
    "merge-effects"
    "cells"
    "diagram-cells"
    "cell-sugar"
    "propagators"
    "application"
    "sugar"
    "generic-definitions"
    "compound-data"
    "physical-closures"
    "standard-propagators"
    "carrying-cells"

    ;;Intervals must follow standard-propagators in the load order
    ;;because it depends on interval-non-zero?, numerical-zero?,
    ;;binary-nothing, and binary-contradiction previously defined.
   
    "intervals"
    "premises"
    "supported-values"
    "truth-maintenance"
    "contradictions"
    "search"
    "amb-utils"

    "ui"
    "explain"

    "example-networks"
    "test-utils"))

(maybe-warn-low-memory)
(initialize-scheduler)
