/**
 * A simple wrapper to perform NUI fetches to the client side.
 * Automatically mocks responses when run in a browser environment (development).
 */

const resourceName = (window as any).GetParentResourceName ? (window as any).GetParentResourceName() : 'ad-appearance';

export const fetchNui = async <T = any>(eventName: string, data?: any, mockData?: T): Promise<T> => {
  const options = {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: JSON.stringify(data),
  };

  // If we are in browser environment, just return the mock data or undefined.
  if (!(window as any).invokeNative) {
    console.log(`[NUI Mock]: ${eventName}`, data);
    return mockData as T;
  }

  try {
    const resp = await fetch(`https://${resourceName}/${eventName}`, options);
    const respFormatted = await resp.json();
    return respFormatted;
  } catch (error) {
    return mockData as T;
  }
};

import { useEffect, useRef } from 'react';

export const useNuiEvent = <T = any>(action: string, handler: (data: T) => void) => {
  const savedHandler = useRef(handler);

  // Update the ref.current value if handler changes.
  // This allows our effect below to always get latest handler without us needing to pass it in effect deps array
  // and potentially cause effect to re-run every render.
  useEffect(() => {
    savedHandler.current = handler;
  }, [handler]);

  useEffect(() => {
    const eventListener = (event: MessageEvent) => {
      const { action: eventAction } = event.data;

      if (eventAction === action) {
        savedHandler.current(event.data);
      } else if (eventAction === "open" && action === "open") {
         // qb-clothing specific: `data` might not be wrapped in event.data.data, it spreads the arguments in event.data.
         savedHandler.current(event.data); 
      }
    };

    window.addEventListener('message', eventListener);
    return () => window.removeEventListener('message', eventListener);
  }, [action]);
};

